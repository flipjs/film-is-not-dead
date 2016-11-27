defmodule FilmIsNotDead.Router do
  use FilmIsNotDead.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FilmIsNotDead do
    pipe_through :api
    resources "/lenses", LensController
    resources "/cameras", CameraController
  end
end
