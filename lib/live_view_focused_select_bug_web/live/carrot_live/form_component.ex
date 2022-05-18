defmodule LiveViewFocusedSelectBugWeb.CarrotLive.FormComponent do
  use LiveViewFocusedSelectBugWeb, :live_component

  alias LiveViewFocusedSelectBug.Vegetables

  @impl true
  def update(%{carrot: carrot} = assigns, socket) do
    changeset = Vegetables.change_carrot(carrot)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"carrot" => carrot_params}, socket) do
    changeset =
      socket.assigns.carrot
      |> Vegetables.change_carrot(carrot_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"carrot" => carrot_params}, socket) do
    save_carrot(socket, socket.assigns.action, carrot_params)
  end

  defp save_carrot(socket, :edit, carrot_params) do
    case Vegetables.update_carrot(socket.assigns.carrot, carrot_params) do
      {:ok, _carrot} ->
        {:noreply,
         socket
         |> put_flash(:info, "Carrot updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_carrot(socket, :new, carrot_params) do
    case Vegetables.create_carrot(carrot_params) do
      {:ok, _carrot} ->
        {:noreply,
         socket
         |> put_flash(:info, "Carrot created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
