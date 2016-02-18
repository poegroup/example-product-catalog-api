defmodule ProductCatalog.Dispatch do
  use PoeApi.Dispatch

  service Cart, ProductCatalog.Service.Cart
  service Product, ProductCatalog.Service.Product
end
