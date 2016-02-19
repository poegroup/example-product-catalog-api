defmodule ProductCatalog.Resource.Products.Rate do
  use PoeApi.Resource

  param product do
    Product.get(value)
  end

  let user = Auth.user_id
  let rating = Input.get("rating") || 0

  hyper do
    action do
      Rating.rate(product.id, user, rating)

      transition_to(ProductCatalog.Resource.Products.Read, product: product)
    end

    affordance do
      %{
        "input" => %{
          "rating" => %{
            "type" => "number",
            "min" => 0,
            "max" => 5,
            "value" => 3
          }
        }
      }
    end
  end
end
