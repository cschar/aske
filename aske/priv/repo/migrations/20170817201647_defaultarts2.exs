defmodule Aske.Repo.Migrations.Defaultarts2 do
  use Ecto.Migration

  def change do
    alter table(:arts) do
      remove :inserted_at
      remove :updated_at
    end
  end
end
