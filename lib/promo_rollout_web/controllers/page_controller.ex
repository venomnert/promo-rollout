defmodule PromoRolloutWeb.PageController do
  use PromoRolloutWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
