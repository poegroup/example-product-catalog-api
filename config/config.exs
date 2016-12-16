use Mix.Config

config :logger, :console,
  level: :info,
  format: "$message
"

config :product_catalog,
  port: (System.get_env("PORT") || "4000") |> String.to_integer
