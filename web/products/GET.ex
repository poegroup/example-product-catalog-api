defmodule ProductCatalog.Resource.Products.GET do
  use ProductCatalog.Resource

  let products = Product.all()

  mediatype Hyper do
    action do
      %{
        "collection" => for product <- products do
          link_to("/products/@product", product: product)
        end
      }
    end
  end
end
