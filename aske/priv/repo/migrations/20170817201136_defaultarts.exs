defmodule Aske.Repo.Migrations.Defaultarts do
  use Ecto.Migration

  def change do
    alter table(:arts) do
      modify :text, :text, default: "Untitled"
      remove :inserted_at
      remove :updated_at
    end
  end
end
