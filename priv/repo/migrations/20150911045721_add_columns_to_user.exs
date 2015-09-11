defmodule Braa.Repo.Migrations.AddColumnsToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :l_name, :string
      add :bio, :text
    end
  end
end
