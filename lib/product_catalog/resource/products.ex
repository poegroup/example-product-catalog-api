defmodule ProductCatalog.Resource.Products do
  use PoeApi.Resource

  hyper do
    action do
      %{
        "collection" => []
      }
    end
  end
end
