defmodule ElixirGistWeb.CreateGistLive do
  use ElixirGistWeb, :live_view
  alias ElixirGist.{Gists, Gists.Gist}

  def mount(_params, _session, socket) do
    socket =
      assign(
        socket,
        form: to_form(Gists.change_gist(%Gist{}))
      )

    {:ok, socket}
  end

  def handle_event("create", %{"gist" => params}, socket) do
    case Gists.create_gist(socket.assigns.current_user, params) do
      {:ok, gist} ->
        changeset = Gists.change_gist(%Gist{})

        socket =
          socket
          |> push_event("clear-textareas", %{})
          |> assign(:form, to_form(changeset))
          |> push_navigate(to: ~p"/gist?#{[id: gist]}")

        {:noreply, socket}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :form, to_form(changeset))}
    end
  end

  def handle_event("validate", %{"gist" => params}, socket) do
    changeset = %Gist{} |> Gists.change_gist(params) |> Map.put(:action, :validate)
    {:noreply, assign(socket, :form, to_form(changeset))}
  end
end
