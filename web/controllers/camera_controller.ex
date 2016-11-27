defmodule FilmIsNotDead.CameraController do
  use FilmIsNotDead.Web, :controller

  alias FilmIsNotDead.Camera

  def index(conn, _params) do
    cameras = Repo.all(Camera)
    render(conn, "index.json", cameras: cameras)
  end

  def create(conn, params) do
    changeset = Camera.changeset(%Camera{}, params)

    case Repo.insert(changeset) do
      {:ok, camera} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", camera_path(conn, :show, camera))
        |> render("show.json", camera: camera)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(FilmIsNotDead.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    camera = Repo.get!(Camera, id)
    render(conn, "show.json", camera: camera)
  end

  def update(conn, %{"id" => id} = params) do
    camera = Repo.get!(Camera, id)
    changeset = Camera.changeset(camera, params)

    case Repo.update(changeset) do
      {:ok, camera} ->
        render(conn, "show.json", camera: camera)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(FilmIsNotDead.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    camera = Repo.get!(Camera, id)
    Repo.delete!(camera)
    send_resp(conn, :no_content, "")
  end
end
