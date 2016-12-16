defmodule ProductCatalog.Resource.GET do
  use ProductCatalog.Resource

  mediatype Hyper do
    action do
      %{
        "cart" => link_to("/cart"),
        "products" => link_to("/products"),
      }
    end
  end
end
