defmodule LiveViewFocusedSelectBugWeb.CarrotLiveTest do
  use LiveViewFocusedSelectBugWeb.ConnCase

  import Phoenix.LiveViewTest
  import LiveViewFocusedSelectBug.VegetablesFixtures

  @create_attrs %{color: "some color", name: "some name"}
  @update_attrs %{color: "some updated color", name: "some updated name"}
  @invalid_attrs %{color: nil, name: nil}

  defp create_carrot(_) do
    carrot = carrot_fixture()
    %{carrot: carrot}
  end

  describe "Index" do
    setup [:create_carrot]

    test "lists all carrots", %{conn: conn, carrot: carrot} do
      {:ok, _index_live, html} = live(conn, Routes.carrot_index_path(conn, :index))

      assert html =~ "Listing Carrots"
      assert html =~ carrot.color
    end

    test "saves new carrot", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.carrot_index_path(conn, :index))

      assert index_live |> element("a", "New Carrot") |> render_click() =~
               "New Carrot"

      assert_patch(index_live, Routes.carrot_index_path(conn, :new))

      assert index_live
             |> form("#carrot-form", carrot: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#carrot-form", carrot: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.carrot_index_path(conn, :index))

      assert html =~ "Carrot created successfully"
      assert html =~ "some color"
    end

    test "updates carrot in listing", %{conn: conn, carrot: carrot} do
      {:ok, index_live, _html} = live(conn, Routes.carrot_index_path(conn, :index))

      assert index_live |> element("#carrot-#{carrot.id} a", "Edit") |> render_click() =~
               "Edit Carrot"

      assert_patch(index_live, Routes.carrot_index_path(conn, :edit, carrot))

      assert index_live
             |> form("#carrot-form", carrot: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#carrot-form", carrot: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.carrot_index_path(conn, :index))

      assert html =~ "Carrot updated successfully"
      assert html =~ "some updated color"
    end

    test "deletes carrot in listing", %{conn: conn, carrot: carrot} do
      {:ok, index_live, _html} = live(conn, Routes.carrot_index_path(conn, :index))

      assert index_live |> element("#carrot-#{carrot.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#carrot-#{carrot.id}")
    end
  end

  describe "Show" do
    setup [:create_carrot]

    test "displays carrot", %{conn: conn, carrot: carrot} do
      {:ok, _show_live, html} = live(conn, Routes.carrot_show_path(conn, :show, carrot))

      assert html =~ "Show Carrot"
      assert html =~ carrot.color
    end

    test "updates carrot within modal", %{conn: conn, carrot: carrot} do
      {:ok, show_live, _html} = live(conn, Routes.carrot_show_path(conn, :show, carrot))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Carrot"

      assert_patch(show_live, Routes.carrot_show_path(conn, :edit, carrot))

      assert show_live
             |> form("#carrot-form", carrot: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#carrot-form", carrot: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.carrot_show_path(conn, :show, carrot))

      assert html =~ "Carrot updated successfully"
      assert html =~ "some updated color"
    end
  end
end
