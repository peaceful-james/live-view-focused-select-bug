defmodule LiveViewFocusedSelectBug.Repo.Migrations.CreateCarrots do
  use Ecto.Migration

  def change do
    create table(:carrots) do
      add :name, :string
      add :color, :string

      timestamps()
    end
  end
end
