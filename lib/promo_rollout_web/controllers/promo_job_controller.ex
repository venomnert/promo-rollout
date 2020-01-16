defmodule PromoRolloutWeb.PromoJobController do
  use PromoRolloutWeb, :controller

  alias PromoRollout.Promos
  alias PromoRollout.Promos.PromoJob

  def index(conn, _params) do
    promo_jobs = Promos.list_promo_jobs()
    render(conn, "index.html", promo_jobs: promo_jobs)
  end

  def new(conn, _params) do
    changeset = Promos.change_promo_job(%PromoJob{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"promo_job" => promo_job_params}) do
    case Promos.create_promo_job(promo_job_params) do
      {:ok, promo_job} ->
        conn
        |> put_flash(:info, "Promo job created successfully.")
        |> redirect(to: Routes.promo_job_path(conn, :show, promo_job))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    promo_job = Promos.get_promo_job!(id)
    render(conn, "show.html", promo_job: promo_job)
  end

  def edit(conn, %{"id" => id}) do
    promo_job = Promos.get_promo_job!(id)
    changeset = Promos.change_promo_job(promo_job)
    render(conn, "edit.html", promo_job: promo_job, changeset: changeset)
  end

  def update(conn, %{"id" => id, "promo_job" => promo_job_params}) do
    promo_job = Promos.get_promo_job!(id)

    case Promos.update_promo_job(promo_job, promo_job_params) do
      {:ok, promo_job} ->
        conn
        |> put_flash(:info, "Promo job updated successfully.")
        |> redirect(to: Routes.promo_job_path(conn, :show, promo_job))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", promo_job: promo_job, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    promo_job = Promos.get_promo_job!(id)
    {:ok, _promo_job} = Promos.delete_promo_job(promo_job)

    conn
    |> put_flash(:info, "Promo job deleted successfully.")
    |> redirect(to: Routes.promo_job_path(conn, :index))
  end
end
