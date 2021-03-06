defmodule AskeWeb.Router do
  use AskeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AskeWeb do
    pipe_through :browser # Use the default browser stack

    get "/", HelloController, :index
    get "/api", APIController, :art_list
    get "/api/:id", APIController, :art_detail

  end

  # Other scopes may use custom stacks.
  # scope "/api", AskeWeb do
  #   pipe_through :api
  # end
end
