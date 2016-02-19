defmodule ProductCatalog.Resource.Cart.Put do
  use PoeApi.Resource

  let user = Auth.user_id
  let product = Input.get("product")
  let quantity = Input.get("quantity") || 1

  hyper do
    action do
      Cart.put(user, product, quantity)

      transition_to(ProductCatalog.Resource.Cart)
    end

    affordance do
      %{
        "input" => %{
          "product" => %{
            "type" => "hidden",
            "value" => Input.get("product")
          },
          "quantity" => %{
            "type" => "number",
            "value" => quantity
          }
        }
      }
    end
  end
end
