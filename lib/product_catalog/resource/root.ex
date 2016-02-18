defmodule ProductCatalog.Resource.Root do
  use PoeApi.Resource

  hyper do
    action do
      %{
        "products" => link_to(ProductCatalog.Resource.Products)
      }
    end
  end
end
