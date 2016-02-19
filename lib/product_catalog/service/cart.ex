defmodule ProductCatalog.Service.Cart do
  def start_link do
    Agent.start_link(fn ->
      :ets.new(__MODULE__, [:public, :named_table, {:read_concurrency, true}])
    end, name: __MODULE__)
  end

  def get(user) do
    :ets.select(__MODULE__, [{{{user, :"$2"}, :"$3"},[],[{{:"$2", :"$3"}}]}])
    |> ok()
  end

  def put(user, item, quantity \\ 1)
  def put(user, item, quantity) when is_binary(quantity) do
    put(user, item, String.to_integer(quantity))
  end
  def put(user, item, quantity) do
    :ets.insert(__MODULE__, {{user, item}, quantity})
    |> ok()
  end

  def delete(user, item) do
    :ets.match_delete(__MODULE__, {{user, item}, :"_"})
    |> ok()
  end

  def empty(user) do
    :ets.match_delete(__MODULE__, {{user, :"_"}, :"_"})
    |> ok()
  end

  defp ok(res) do
    {:ok, res}
  end
end
