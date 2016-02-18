defmodule ProductCatalog.HTTP do
  use PoeApi.HTTP

  get     "/",                             ProductCatalog.Resource.Root
  get     "/cart",                         ProductCatalog.Resource.Cart
  put     "/cart",                         ProductCatalog.Resource.Cart.Put
  delete  "/cart",                         ProductCatalog.Resource.Cart.Delete
  post    "/cart",                         ProductCatalog.Resource.Cart.Checkout
  get     "/products",                     ProductCatalog.Resource.Products
  get     "/products/:product",            ProductCatalog.Resource.Products.Read
end
