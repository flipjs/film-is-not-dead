defmodule FilmIsNotDead.LensView do
  use FilmIsNotDead.Web, :view

  def render("index.json", %{lenses: lenses}) do
    %{records: render_many(lenses, FilmIsNotDead.LensView, "lens.json")}
  end

  def render("show.json", %{lens: lens}) do
    render_one(lens, FilmIsNotDead.LensView, "lens.json")
  end

  def render("lens.json", %{lens: lens}) do
    %{id: lens.id,
      name: lens.name,
      description: lens.description,
      active: lens.active,
      notes: lens.notes}
  end
end

