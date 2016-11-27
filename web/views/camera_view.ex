defmodule FilmIsNotDead.CameraView do
  use FilmIsNotDead.Web, :view

  def render("index.json", %{cameras: cameras}) do
    %{records: render_many(cameras, FilmIsNotDead.CameraView, "camera.json")}
  end

  def render("show.json", %{camera: camera}) do
    render_one(camera, FilmIsNotDead.CameraView, "camera.json")
  end

  def render("camera.json", %{camera: camera}) do
    %{id: camera.id,
      name: camera.name,
      description: camera.description,
      fixed_lens: camera.fixed_lens,
      active: camera.active,
      notes: camera.notes}
  end
end

