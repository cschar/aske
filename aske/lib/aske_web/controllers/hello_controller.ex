import Ecto.Query, only: [from: 2]

defmodule AskeWeb.HelloController do
  use AskeWeb, :controller
  alias Aske.Repo
  alias Aske.User
  alias Aske.Art
#  import Ecto.query

  # add _ to avoid compiler warning
  def index(conn, _params) do
  conn
  |> assign(:message, "Welcome Back!")
  |> assign(:name, "Dweezil")
  |> render("index.html")
#    render conn, "index.html"
  end

  def show(conn, %{"messenger" => messenger1}) do

#    alias Ecto.query
    umails = [111,"2"]
    rep_users = Repo.all(from u in User,
                         select: u.email)
    arts = Repo.all(from a in Art,
                    select: a.text)

    render conn, "show.html",
           messenger: messenger1,
           emails: umails,
           users: rep_users,
           arts: arts
  end

  #if we needed access to all params...
  #def show(conn, %{"messenger" => messenger} = params) do


end