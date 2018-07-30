defmodule WorldviewWeb.PageController do
  use WorldviewWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
