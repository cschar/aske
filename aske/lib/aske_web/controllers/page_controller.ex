defmodule AskeWeb.PageController do
  use AskeWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def art_list(conn, _params) do

  end

  def art_detail(conn, %{"id" => id}) do

  end

end
