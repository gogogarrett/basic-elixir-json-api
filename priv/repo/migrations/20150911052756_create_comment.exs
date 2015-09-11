defmodule Braa.Repo.Migrations.CreateComment do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :text
      add :user_id, :integer

      timestamps
    end

  end
end
