defmodule ProductCatalog.Resource.Root do
  use PoeApi.Resource

  hyper do
    action do
      %{
        "cart" => link_to(ProductCatalog.Resource.Cart),
        "products" => link_to(ProductCatalog.Resource.Products),
      }
    end
  end
end
