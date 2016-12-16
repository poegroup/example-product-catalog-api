defmodule ProductCatalog.Mixfile do
  use Mix.Project

  def project do
    [app: :product_catalog,
     version: "0.1.0",
     elixir: "~> 1.0",
     deps: deps(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     test_paths: ["web"],
     elixirc_paths: ["lib", "web"]
   ]
  end

  def application do
    [mod: { ProductCatalog, []},
     applications: [
       :logger,
       :poe_api
     ] ++ (Mix.env == :dev && dev_applications || [])]
  end

  defp dev_applications do
    [:rl,]
  end

  defp deps do
    [{:poe_api, "~> 0.2.0"},
     {:rl, github: "camshaft/rl", only: [:dev, :test]},]
  end
end
