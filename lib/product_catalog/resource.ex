defmodule ProductCatalog.Resource do
  defmacro __using__(_) do
    quote do
      use PoeApi.Resource
      alias ProductCatalog.Service.{Auth,Cart,Product,Rating}
      require Auth
    end
  end
end
