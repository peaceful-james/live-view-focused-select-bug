defmodule LiveViewFocusedSelectBug.Vegetables.Carrot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carrots" do
    field :color, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(carrot, attrs) do
    carrot
    |> cast(attrs, [:name, :color])
    |> validate_required([:name, :color])
  end
end
