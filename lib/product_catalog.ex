defmodule ProductCatalog do
  use Application
  require Logger

  def start(_type, _args) do
    if Mix.env == :dev do
      PoeApi.Dev.start()
    end
    ProductCatalog.HTTP.start()
    ProductCatalog.Supervisor.start_link()
  end
end
