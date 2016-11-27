defmodule FilmIsNotDead.Repo.Migrations.CreateCamera do
  use Ecto.Migration

  def change do
    create table(:cameras) do
      add :name, :string
      add :description, :string
      add :fixed_lens, :boolean
      add :active, :boolean
      add :notes, :string
    end
  end
end
