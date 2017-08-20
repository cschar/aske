import Ecto.Query, only: [from: 2, limit: 2]

defmodule AskeWeb.APIController do
  use AskeWeb, :controller
#  alias Aske.Router.Helpers
  alias Aske.Art
  alias Aske.Repo


  def art_list(conn, params) do
#    arts = Repo.all(from aw in Art,
#                    select: [aw.id,aw.text,aw.website])
    arts = Art |> Repo.paginate(params)
    data = Enum.map(arts.entries,
        fn(x) -> %{text: x.text,
                   website: x.website} end)

    cond do
      arts.page_number == arts.total_pages ->
        next_page = arts.page_number
      arts.page_number < arts.total_pages ->
        next_page = arts.page_number + 1
    end

    json conn, %{data: data,
                 page: arts.page_number,
    total: arts.total_entries,
    next: api_url(conn, :art_list, page: next_page ),
    totalPages: arts.total_pages}

  end

  def art_detail(conn, %{"id" => id}) do
    art = Repo.get(Art, id)
    json conn, %{id: id,
      text: art.text,
      site: art.website}

  end

end
