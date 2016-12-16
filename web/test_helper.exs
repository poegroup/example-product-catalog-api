defmodule Test.ProductCatalog.Resource do
  defmacro __using__(_) do
    resource = __CALLER__.module |> Module.split() |> tl() |> Module.concat()
    quote do
      use Mazurka.Plug.Test, router: ProductCatalog.Router,
                             resource: unquote(resource)
    end
  end

  defmacro seed(module, params \\ Macro.escape(%{})) do
    quote do
      unquote(module).seed(unquote(params))
    end
  end
end

ExUnit.start()
