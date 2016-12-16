defmodule ProductCatalog.Resource.Cart.PUT do
  use ProductCatalog.Resource

  let user = Auth.user_id

  input product
  input quantity, fn
    (nil) -> 1
    (q) -> q
  end

  mediatype Hyper do
    action do
      Cart.put(user, product, quantity)

      transition_to("/cart")
    end

    affordance do
      %{
        "input" => %{
          "product" => %{
            "type" => "hidden",
            "value" => product
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
