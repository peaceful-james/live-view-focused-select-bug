defmodule LiveViewFocusedSelectBugWeb.CarrotLive.Index do
  use LiveViewFocusedSelectBugWeb, :live_view

  alias LiveViewFocusedSelectBug.Vegetables
  alias LiveViewFocusedSelectBug.Vegetables.Carrot

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :carrots, list_carrots())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Carrot")
    |> assign(:carrot, Vegetables.get_carrot!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Carrot")
    |> assign(:carrot, %Carrot{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Carrots")
    |> assign(:carrot, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    carrot = Vegetables.get_carrot!(id)
    {:ok, _} = Vegetables.delete_carrot(carrot)

    {:noreply, assign(socket, :carrots, list_carrots())}
  end

  defp list_carrots do
    Vegetables.list_carrots()
  end
end
