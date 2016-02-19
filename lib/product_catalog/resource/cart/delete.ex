defmodule ProductCatalog.Resource.Cart.Delete do
  use PoeApi.Resource

  let user = Auth.user_id
  let product = Input.get("product")

  hyper do
    action do
      Cart.delete(user, product)

      transition_to(ProductCatalog.Resource.Cart)
    end

    affordance do
      %{
        "input" => %{
          "product" => %{
            "type" => "hidden",
            "value" => Input.get("product")
          }
        }
      }
    end
  end
end
