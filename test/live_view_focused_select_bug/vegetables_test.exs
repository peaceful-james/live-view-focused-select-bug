defmodule LiveViewFocusedSelectBug.VegetablesTest do
  use LiveViewFocusedSelectBug.DataCase

  alias LiveViewFocusedSelectBug.Vegetables

  describe "carrots" do
    alias LiveViewFocusedSelectBug.Vegetables.Carrot

    import LiveViewFocusedSelectBug.VegetablesFixtures

    @invalid_attrs %{color: nil, name: nil}

    test "list_carrots/0 returns all carrots" do
      carrot = carrot_fixture()
      assert Vegetables.list_carrots() == [carrot]
    end

    test "get_carrot!/1 returns the carrot with given id" do
      carrot = carrot_fixture()
      assert Vegetables.get_carrot!(carrot.id) == carrot
    end

    test "create_carrot/1 with valid data creates a carrot" do
      valid_attrs = %{color: "some color", name: "some name"}

      assert {:ok, %Carrot{} = carrot} = Vegetables.create_carrot(valid_attrs)
      assert carrot.color == "some color"
      assert carrot.name == "some name"
    end

    test "create_carrot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vegetables.create_carrot(@invalid_attrs)
    end

    test "update_carrot/2 with valid data updates the carrot" do
      carrot = carrot_fixture()
      update_attrs = %{color: "some updated color", name: "some updated name"}

      assert {:ok, %Carrot{} = carrot} = Vegetables.update_carrot(carrot, update_attrs)
      assert carrot.color == "some updated color"
      assert carrot.name == "some updated name"
    end

    test "update_carrot/2 with invalid data returns error changeset" do
      carrot = carrot_fixture()
      assert {:error, %Ecto.Changeset{}} = Vegetables.update_carrot(carrot, @invalid_attrs)
      assert carrot == Vegetables.get_carrot!(carrot.id)
    end

    test "delete_carrot/1 deletes the carrot" do
      carrot = carrot_fixture()
      assert {:ok, %Carrot{}} = Vegetables.delete_carrot(carrot)
      assert_raise Ecto.NoResultsError, fn -> Vegetables.get_carrot!(carrot.id) end
    end

    test "change_carrot/1 returns a carrot changeset" do
      carrot = carrot_fixture()
      assert %Ecto.Changeset{} = Vegetables.change_carrot(carrot)
    end
  end
end
