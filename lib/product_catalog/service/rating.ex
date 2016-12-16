defmodule ProductCatalog.Service.Rating do
  def start_link do
    Agent.start_link(fn ->
      :ets.new(__MODULE__, [:public, :named_table, {:read_concurrency, true}])
    end, name: __MODULE__)
  end

  def get(item) do
    :ets.select(__MODULE__, [{{{item, :"_"}, :"$1"},[],[:"$1"]}])
    |> avg
  rescue
    ArgumentError ->
      0
  end

  def rate(item, user, rating) when is_binary(rating) do
    rate(item, user, String.to_integer(rating))
  end
  def rate(item, user, rating) when is_integer(rating) do
    :ets.insert(__MODULE__, {{item, user}, rating})
  end

  defp avg([]) do
    0.0
  end
  defp avg(ratings) do
    ratings
    |> Enum.reduce(0, fn(rating, acc) when is_integer(rating) ->
      acc + rating
    end)
    |> divide(length(ratings))
  end

  defp divide(n, d) do
    n / d
  end
end
