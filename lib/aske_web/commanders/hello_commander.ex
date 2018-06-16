defmodule AskeWeb.HelloCommander do
  use Drab.Commander

  alias Aske.Repo
  alias Aske.User
  alias Aske.Art
  # Place your event handlers here
  #
  # defhandler button_clicked(socket, sender) do
  #   set_prop socket, "#output_div", innerHTML: "Clicked the button!"
  # end
  #
  # Place you callbacks here
  #
  # onload :page_loaded
  #
  # def page_loaded(socket) do
  #   set_prop socket, "div.jumbotron h2", innerText: "This page has been drabbed"
  # end

  onload :page_loaded

  # Drab Callbacks
  def page_loaded(socket) do
    # poke socket, welcome_text: "This page has been drabbed"
    # set_prop socket, "div.drabber",
    #   innerHTML: "Please visit <a href='https://tg.pl/drab'>Drab</a> page for more"
  end

  # defhandler uppercase(socket, sender) do
  #   text = sender.params["text_to_uppercase"]
  #   poke socket, text: String.upcase(text)
  # end

  # defhandler downcase(socket, sender) do
  #   text = sender.params["text_to_uppercase"]
  #   poke socket, text: String.downcase(text)
  # end

  defhandler clicked(socket, sender) do
    
    page_num = sender["page_num"]
    arts = Art |> Repo.paginate(page: page_num, page_size: 5)
    
    html_string = Phoenix.View.render_to_string(AskeWeb.HelloView, "list.html", arts: arts)
    set_prop socket, "#preview", innerHTML: html_string
  end

  defhandler randomclicked(socket, sender) do
    IO.puts "random"
    x = Art |> Repo.paginate
    page_num = Enum.random(0..x.total_pages)
    arts = Art |> Repo.paginate(page: page_num, page_size: 50)
    
    html_string = Phoenix.View.render_to_string(AskeWeb.HelloView, "list.html", arts: arts)
    set_prop socket, "#preview", innerHTML: html_string
    # set_prop socket, "#preview", innerHTML: "Hey"
  end

end
