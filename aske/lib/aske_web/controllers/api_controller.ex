import Ecto.Query, only: [from: 2, limit: 2]

defmodule AskeWeb.APIController do
  use AskeWeb, :controller
  alias Aske.Art
  alias Aske.Repo

  def art_list(conn, _params) do

    arts = Repo.all(from aw in Art,
                    select: [aw.id,aw.text,aw.website])

    json conn, %{data: arts}
  end

  def art_detail(conn, %{"id" => id}) do
    art = Repo.get(Art, id)
    json conn, %{id: id, text: art.text, site: art.website}

  end

end
