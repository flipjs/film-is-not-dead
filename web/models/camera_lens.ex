defmodule FilmIsNotDead.CameraLens do
  use FilmIsNotDead.Web, :model

  @primary_key false
  schema "camera_lens" do
    belongs_to :camera, FilmIsNotDead.Camera
    belongs_to :lens, FilmIsNotDead.Lens
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [:camera_id, :lens_id])
    |> validate_required([:camera_id, :lens_id])
  end
end
