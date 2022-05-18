defmodule LiveViewFocusedSelectBugWeb.PageController do
  use LiveViewFocusedSelectBugWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
