defmodule ProductCatalog.Resource.Products.Product_.GET do
  use ProductCatalog.Resource

  param product, &Product.get/1

  let rating = Rating.get(product.id)

  mediatype Hyper do
    action do
      %{
        "title" => product.title,
        "description" => product.description,
        "image" => %{
          "src" => product.image
        },
        "price" => product.price,
        "rating" => rating,
        "rate" => link_to("PUT /products/@product/rate", product: product.id),
        "add" => link_to("PUT /cart", [], product: product.id)
      }
    end
  end
end
