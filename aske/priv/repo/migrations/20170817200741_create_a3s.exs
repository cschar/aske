defmodule Aske.Repo.Migrations.CreateA3s do
  use Ecto.Migration

  def change do
    create table(:a3s) do
      add :text, :text, default: "Untitled"
      add :website, :string

      timestamps()
    end

  end
end
