defmodule ProductCatalog.Mixfile do
  use Mix.Project

  def project do
    [app: :product_catalog,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger,
                    :poe_api],
     mod: { ProductCatalog, [] },]
  end

  defp deps do
    [{ :poe_api, github: "poegroup/poe-api" }]
  end
end
