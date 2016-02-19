defmodule ProductCatalog.Dispatch do
  use PoeApi.Dispatch

  defp exec(Auth, :user_id, [], conn, _, _, _) do
    {:ok, to_string(:erlang.phash2(conn.remote_ip))}
  end

  service Cart, ProductCatalog.Service.Cart
  service Product, ProductCatalog.Service.Product
  service Rating, ProductCatalog.Service.Rating
end
