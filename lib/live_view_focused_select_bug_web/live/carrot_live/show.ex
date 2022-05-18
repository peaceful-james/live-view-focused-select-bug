defmodule LiveViewFocusedSelectBugWeb.CarrotLive.Show do
  use LiveViewFocusedSelectBugWeb, :live_view

  alias LiveViewFocusedSelectBug.Vegetables

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:carrot, Vegetables.get_carrot!(id))}
  end

  defp page_title(:show), do: "Show Carrot"
  defp page_title(:edit), do: "Edit Carrot"
end
