defmodule ProductCatalog.Service.Product do
  def all do
    [
      "1",
      "2",
      "3"
    ]
    |> ok()
  end

  def get("1") do
    %{
      title: "...",
      description: "...",
      image: "...",
      price: "..."
    }
    |> ok()
  end

  defp ok(res) do
    {:ok, res}
  end
end
