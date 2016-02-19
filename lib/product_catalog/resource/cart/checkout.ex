defmodule ProductCatalog.Resource.Cart.Checkout do
  use PoeApi.Resource

  let user = Auth.user_id

  hyper do
    action do
      Cart.empty(user)

      transition_to(ProductCatalog.Resource.Cart)
    end

    affordance do
      %{
        "input" => %{}
      }
    end
  end
end
