defmodule LiveViewFocusedSelectBug.Vegetables do
  @moduledoc """
  The Vegetables context.
  """

  import Ecto.Query, warn: false
  alias LiveViewFocusedSelectBug.Repo

  alias LiveViewFocusedSelectBug.Vegetables.Carrot

  @doc """
  Returns the list of carrots.

  ## Examples

      iex> list_carrots()
      [%Carrot{}, ...]

  """
  def list_carrots do
    Repo.all(Carrot)
  end

  @doc """
  Gets a single carrot.

  Raises `Ecto.NoResultsError` if the Carrot does not exist.

  ## Examples

      iex> get_carrot!(123)
      %Carrot{}

      iex> get_carrot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_carrot!(id), do: Repo.get!(Carrot, id)

  @doc """
  Creates a carrot.

  ## Examples

      iex> create_carrot(%{field: value})
      {:ok, %Carrot{}}

      iex> create_carrot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_carrot(attrs \\ %{}) do
    %Carrot{}
    |> Carrot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a carrot.

  ## Examples

      iex> update_carrot(carrot, %{field: new_value})
      {:ok, %Carrot{}}

      iex> update_carrot(carrot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_carrot(%Carrot{} = carrot, attrs) do
    carrot
    |> Carrot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a carrot.

  ## Examples

      iex> delete_carrot(carrot)
      {:ok, %Carrot{}}

      iex> delete_carrot(carrot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_carrot(%Carrot{} = carrot) do
    Repo.delete(carrot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking carrot changes.

  ## Examples

      iex> change_carrot(carrot)
      %Ecto.Changeset{data: %Carrot{}}

  """
  def change_carrot(%Carrot{} = carrot, attrs \\ %{}) do
    Carrot.changeset(carrot, attrs)
  end
end
