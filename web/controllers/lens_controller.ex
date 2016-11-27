defmodule FilmIsNotDead.LensController do
  use FilmIsNotDead.Web, :controller

  alias FilmIsNotDead.Lens

  def index(conn, _params) do
    lenses = Repo.all(Lens)
    render(conn, "index.json", lenses: lenses)
  end

  def create(conn, params) do
    changeset = Lens.changeset(%Lens{}, params)

    case Repo.insert(changeset) do
      {:ok, lens} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", lens_path(conn, :show, lens))
        |> render("show.json", lens: lens)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(FilmIsNotDead.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lens = Repo.get!(Lens, id)
    render(conn, "show.json", lens: lens)
  end

  def update(conn, %{"id" => id} = params) do
    lens = Repo.get!(Lens, id)
    changeset = Lens.changeset(lens, params)

    case Repo.update(changeset) do
      {:ok, lens} ->
        render(conn, "show.json", lens: lens)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(FilmIsNotDead.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lens = Repo.get!(Lens, id)
    Repo.delete!(lens)
    send_resp(conn, :no_content, "")
  end
end
