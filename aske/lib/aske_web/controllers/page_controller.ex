defmodule AskeWeb.PageController do
  use AskeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
