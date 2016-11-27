defmodule FilmIsNotDead.Repo.Migrations.CreateLens do
  use Ecto.Migration

  def change do
    create table(:lenses) do
      add :name, :string
      add :description, :string
      add :active, :boolean
      add :notes, :string
    end
  end
end
