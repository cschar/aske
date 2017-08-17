defmodule AskeWeb.HelloView do
  use AskeWeb, :view

  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Map.keys()
  end

end