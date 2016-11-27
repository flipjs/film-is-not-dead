defmodule FilmIsNotDead.Camera do
  use FilmIsNotDead.Web, :model

  schema "cameras" do
    field :name, :string
    field :description, :string
    field :fixed_lens, :boolean, default: true
    field :active, :boolean, default: true
    field :notes, :string
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, [:name, :description, :fixed_lens, :active, :notes])
    |> validate_required([:name])
  end
end
