defmodule Aske.Repo.Migrations.CreateArts do
  use Ecto.Migration

  def change do
    create table(:arts) do
      add :text, :string
      add :website, :string

      timestamps()
    end

  end
end
