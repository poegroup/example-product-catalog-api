defmodule ProductCatalog.Resource.Products.Read do
  use PoeApi.Resource

  param product do
    Product.get(value)
  end

  let rating = Rating.get(product.id)

  hyper do
    action do
      %{
        "title" => product.title,
        "description" => product.description,
        "image" => %{
          "src" => product.image
        },
        "price" => product.price,
        "rating" => rating,
        "rate" => link_to(ProductCatalog.Resource.Products.Rate, product: product),
        "add" => link_to(ProductCatalog.Resource.Cart.Put, [], product: product)
      }
    end
  end
end
