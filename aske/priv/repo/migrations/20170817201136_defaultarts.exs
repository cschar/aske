defmodule Aske.Repo.Migrations.Defaultarts do
  use Ecto.Migration

  def change do
    alter table(:arts) do
      modify :text, :text, default: "Untitled"
    end
  end
end
