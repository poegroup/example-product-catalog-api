defmodule ProductCatalog.Service.Auth do
  defmacro user_id() do
    quote do
      var!(conn).remote_ip
      |> :erlang.phash2()
      |> to_string()
    end
  end
end
