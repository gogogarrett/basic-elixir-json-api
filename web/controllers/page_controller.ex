defmodule Braa.PageController do
  use Braa.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
