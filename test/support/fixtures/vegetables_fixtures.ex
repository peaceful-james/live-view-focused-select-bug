defmodule LiveViewFocusedSelectBug.VegetablesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveViewFocusedSelectBug.Vegetables` context.
  """

  @doc """
  Generate a carrot.
  """
  def carrot_fixture(attrs \\ %{}) do
    {:ok, carrot} =
      attrs
      |> Enum.into(%{
        color: "some color",
        name: "some name"
      })
      |> LiveViewFocusedSelectBug.Vegetables.create_carrot()

    carrot
  end
end
