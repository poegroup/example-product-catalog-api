defmodule ProductCatalog.Resource.Cart.DELETE do
  use ProductCatalog.Resource

  let user = Auth.user_id
  input product

  mediatype Hyper do
    action do
      Cart.delete(user, product)

      transition_to("/cart")
    end

    affordance do
      %{
        "input" => %{
          "product" => %{
            "type" => "hidden",
            "value" => product
          }
        }
      }
    end
  end
end
