defmodule ProductCatalog.Resource.Products.Product_.Rate.PUT do
  use ProductCatalog.Resource

  param product, &Product.get/1

  let user = Auth.user_id

  input rating, fn
    (nil) -> 0
    (r) -> r
  end

  mediatype Hyper do
    action do
      Rating.rate(product.id, user, rating)

      transition_to("/products/@product", product: product)
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
