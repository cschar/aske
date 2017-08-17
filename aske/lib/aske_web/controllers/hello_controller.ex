defmodule AskeWeb.HelloController do
  use AskeWeb, :controller

  # add _ to avoid compiler warning
  def index(conn, _params) do
    render conn, "index.html"
  end

  #%{} is map syntax
  #In contrast to keyword lists,
  #maps are very useful with pattern matching.
  #When a map is used in a pattern, it will always
  #match on a subset of the given value:

  def show(conn, %{"messenger" => messenger1}) do
    render conn, "show.html", messenger: messenger1
  end

  #if we needed access to all params...
  #def show(conn, %{"messenger" => messenger} = params) do


end