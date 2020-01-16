defmodule PromoRolloutWeb.LandingPageUrlController do
  use PromoRolloutWeb, :controller

  alias PromoRollout.Promos
  alias PromoRollout.Promos.LandingPageUrl

  def index(conn, _params) do
    landing_page_urls = Promos.list_landing_page_urls()
    render(conn, "index.html", landing_page_urls: landing_page_urls)
  end

  def new(conn, _params) do
    changeset = Promos.change_landing_page_url(%LandingPageUrl{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"landing_page_url" => landing_page_url_params}) do
    case Promos.create_landing_page_url(landing_page_url_params) do
      {:ok, landing_page_url} ->
        conn
        |> put_flash(:info, "Landing page url created successfully.")
        |> redirect(to: Routes.landing_page_url_path(conn, :show, landing_page_url))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    landing_page_url = Promos.get_landing_page_url!(id)
    render(conn, "show.html", landing_page_url: landing_page_url)
  end

  def edit(conn, %{"id" => id}) do
    landing_page_url = Promos.get_landing_page_url!(id)
    changeset = Promos.change_landing_page_url(landing_page_url)
    render(conn, "edit.html", landing_page_url: landing_page_url, changeset: changeset)
  end

  def update(conn, %{"id" => id, "landing_page_url" => landing_page_url_params}) do
    landing_page_url = Promos.get_landing_page_url!(id)

    case Promos.update_landing_page_url(landing_page_url, landing_page_url_params) do
      {:ok, landing_page_url} ->
        conn
        |> put_flash(:info, "Landing page url updated successfully.")
        |> redirect(to: Routes.landing_page_url_path(conn, :show, landing_page_url))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", landing_page_url: landing_page_url, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    landing_page_url = Promos.get_landing_page_url!(id)
    {:ok, _landing_page_url} = Promos.delete_landing_page_url(landing_page_url)

    conn
    |> put_flash(:info, "Landing page url deleted successfully.")
    |> redirect(to: Routes.landing_page_url_path(conn, :index))
  end
end
