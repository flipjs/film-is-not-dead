defmodule FilmIsNotDead.Lens do
  use FilmIsNotDead.Web, :model

  schema "lenses" do
    field :name, :string
    field :description, :string
    field :active, :boolean, default: true
    field :notes, :string
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [:name, :description, :active, :notes])
    |> validate_required([:name])
  end
end
