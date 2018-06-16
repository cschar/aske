defmodule Aske.Art do
  use Ecto.Schema
  import Ecto.Changeset
  alias Aske.Art


  schema "arts" do
    field :text, :string
    field :website, :string

  end

  @doc false
  def changeset(%Art{} = art, attrs) do
    art
    |> cast(attrs, [:text, :website])
    |> validate_required([:text, :website])
  end
end
