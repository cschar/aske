defmodule Aske.Art2 do
  use Ecto.Schema
  import Ecto.Changeset
  alias Aske.Art2


  schema "art2s" do
    field :text, :string
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(%Art2{} = art2, attrs) do
    art2
    |> cast(attrs, [:text, :website])
    |> validate_required([:text, :website])
  end
end
