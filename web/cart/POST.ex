defmodule ProductCatalog.Resource.Cart.POST do
  use ProductCatalog.Resource

  let user = Auth.user_id
  let cart = Cart.get(user)

  condition cart != []

  mediatype Hyper do
    action do
      Cart.empty(user)

      transition_to("/cart")
    end

    affordance do
      %{
        "input" => %{}
      }
    end
  end
end
