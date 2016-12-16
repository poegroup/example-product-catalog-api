defmodule ProductCatalog.Resource.Cart.GET do
  use ProductCatalog.Resource

  let user = Auth.user_id

  let products = Cart.get(user)

  mediatype Hyper do
    action do
      %{
        "checkout" => link_to("POST /cart"),
        "total" => total(products),
        "collection" => for {product, quantity} <- products do
          %{
            "product" => link_to("/products/@product", product: product),
            "quantity" => %{
              "data" => quantity,
              "edit" => link_to("PUT /cart", [], product: product, quantity: quantity)
            },
            "remove" => link_to("DELETE /cart", [], product: product)
          }
        end
      }
    end
  end

  defp total(products) do
    Enum.reduce(products, 0, fn({product, quantity}, acc) ->
      acc + Product.get(product).price * quantity
    end)
  end
end
