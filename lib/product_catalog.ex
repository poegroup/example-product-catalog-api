defmodule ProductCatalog do
  use PoeApi

  worker(ProductCatalog.Service.Cart, [])
  worker(ProductCatalog.Service.Rating, [])
end
