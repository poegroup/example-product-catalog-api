defmodule ProductCatalog.Resource.Products do
  use PoeApi.Resource

  let products = Product.all()

  hyper do
    action do
      %{
        "collection" => for product <- products do
          link_to(ProductCatalog.Resource.Products.Read, product: product)
        end
      }
    end
  end
end
