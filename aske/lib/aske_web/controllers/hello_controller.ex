import Ecto.Query, only: [from: 2]

defmodule AskeWeb.HelloController do
  use AskeWeb, :controller
  alias Aske.Repo
  alias Aske.User
  alias Aske.Art
#  import Ecto.query

  def index(conn, params) do

    page = Art |> Repo.paginate(params)


    render conn, "index.html",
           arts: page.entries,
           page: page

  end

  def show(conn, %{"messenger" => messenger1} = params) do

#    alias Ecto.query
    umails = [111,"2"]
    rep_users = Repo.all(from u in User,
                         select: u.email)
#    arts = Repo.all(from a in Art,
#                    select: a.text)

    arts = Art |> Repo.paginate(params)


    render conn, "show.html",
           messenger: messenger1,
           emails: umails,
           users: rep_users,
           arts: arts
  end

  #if we needed access to all params...
  #def show(conn, %{"messenger" => messenger} = params) do


end