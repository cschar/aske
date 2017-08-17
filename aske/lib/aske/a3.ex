defmodule Aske.A3 do
  use Ecto.Schema
  import Ecto.Changeset
  alias Aske.A3


  schema "a3s" do
    field :text, :string
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(%A3{} = a3, attrs) do
    a3
    |> cast(attrs, [:text, :website])
    |> validate_required([:text, :website])
  end
end
