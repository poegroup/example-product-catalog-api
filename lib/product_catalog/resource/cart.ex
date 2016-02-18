defmodule ProductCatalog.Resource.Cart do
  use PoeApi.Resource

  hyper do
    action do
      %{
        "collection" => []
      }
    end
  end
end
