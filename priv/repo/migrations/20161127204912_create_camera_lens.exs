defmodule FilmIsNotDead.Repo.Migrations.CreateCameraLens do
  use Ecto.Migration

  def change do
    create table(:camera_lens, primary_key: false) do
      add :camera_id, references(:cameras, on_delete: :delete_all)
      add :lens_id, references(:lenses, on_delete: :delete_all)
    end
  end
end
