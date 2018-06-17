defmodule AskeWeb.LayoutView do
  use AskeWeb, :view

  def hostname do
    h = System.get_env("HOSTNAME")
    case h do
      nil -> "http://localhost:4000"
        _ -> h
    end
  end
end
