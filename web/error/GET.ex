defmodule ProductCatalog.Resource.Error.GET do
  use ProductCatalog.Resource

  mediatype Hyper do
    action do
      %{
        "error" => %{
          "message" => "Resource not found"
        }
      }
    end
  end
end
