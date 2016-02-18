defmodule ProductCatalog.Service.Cart do
  def start_link do
    Agent.start_link(fn ->
      :ets.new(__MODULE__, [:bag, :public, :named_table, {:read_concurrency, true}])
    end, name: __MODULE__)
  end

  def get(user) do
    :ets.lookup_element(__MODULE__, user, 2)
    |> ok()
  rescue
    ArgumentError ->
      ok([])
  end

  def put(user, item) do
    :ets.insert(__MODULE__, {user, item})
    |> ok()
  end

  def delete(user, item) do
    :ets.delete_object(__MODULE__, {user, item})
    |> ok()
  end

  def empty(user) do
    :ets.delete(__MODULE__, user)
    |> ok()
  end

  defp ok(res) do
    {:ok, res}
  end
end
