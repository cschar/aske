defmodule Aske.Repo.Migrations.CreateArt2s do
  use Ecto.Migration

  def change do
    create table(:art2s) do
      add :text, :text
      add :website, :string

      timestamps()
    end

  end
end
