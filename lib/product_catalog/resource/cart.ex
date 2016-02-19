defmodule ProductCatalog.Resource.Cart do
  use PoeApi.Resource

  let user = Auth.user_id

  let products = Cart.get(user)

  hyper do
    action do
      %{
        "checkout" => link_to(ProductCatalog.Resource.Cart.Checkout),
        "collection" => for {product, quantity} <- products do
          %{
            "product" => link_to(ProductCatalog.Resource.Products.Read, product: product),
            "quantity" => %{
              "data" => quantity,
              "edit" => link_to(ProductCatalog.Resource.Cart.Put, [], product: product, quantity: quantity)
            },
            "remove" => link_to(ProductCatalog.Resource.Cart.Delete, [], product: product)
          }
        end
      }
    end
  end
end
