defmodule AskeWeb.HelloView do
  use AskeWeb, :view

  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Map.keys()
  end

  def pagination_items(page) do
      range = Enum.into 1..page.total_pages, []

  end

end