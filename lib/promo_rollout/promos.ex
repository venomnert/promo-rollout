defmodule PromoRollout.Promos do
  @moduledoc """
  The Promos context.
  """

  import Ecto.Query, warn: false
  alias PromoRollout.Repo

  alias PromoRollout.Promos.PromoJob

  @doc """
  Returns the list of promo_jobs.

  ## Examples

      iex> list_promo_jobs()
      [%PromoJob{}, ...]

  """
  def list_promo_jobs do
    Repo.all(PromoJob)
  end

  @doc """
  Gets a single promo_job.

  Raises `Ecto.NoResultsError` if the Promo job does not exist.

  ## Examples

      iex> get_promo_job!(123)
      %PromoJob{}

      iex> get_promo_job!(456)
      ** (Ecto.NoResultsError)

  """
  def get_promo_job!(id), do: Repo.get!(PromoJob, id)

  @doc """
  Creates a promo_job.

  ## Examples

      iex> create_promo_job(%{field: value})
      {:ok, %PromoJob{}}

      iex> create_promo_job(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_promo_job(attrs \\ %{}) do
    %PromoJob{}
    |> PromoJob.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a promo_job.

  ## Examples

      iex> update_promo_job(promo_job, %{field: new_value})
      {:ok, %PromoJob{}}

      iex> update_promo_job(promo_job, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_promo_job(%PromoJob{} = promo_job, attrs) do
    promo_job
    |> PromoJob.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PromoJob.

  ## Examples

      iex> delete_promo_job(promo_job)
      {:ok, %PromoJob{}}

      iex> delete_promo_job(promo_job)
      {:error, %Ecto.Changeset{}}

  """
  def delete_promo_job(%PromoJob{} = promo_job) do
    Repo.delete(promo_job)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking promo_job changes.

  ## Examples

      iex> change_promo_job(promo_job)
      %Ecto.Changeset{source: %PromoJob{}}

  """
  def change_promo_job(%PromoJob{} = promo_job) do
    PromoJob.changeset(promo_job, %{})
  end

  alias PromoRollout.Promos.LandingPageUrl

  @doc """
  Returns the list of landing_page_urls.

  ## Examples

      iex> list_landing_page_urls()
      [%LandingPageUrl{}, ...]

  """
  def list_landing_page_urls do
    Repo.all(LandingPageUrl)
  end

  @doc """
  Gets a single landing_page_url.

  Raises `Ecto.NoResultsError` if the Landing page url does not exist.

  ## Examples

      iex> get_landing_page_url!(123)
      %LandingPageUrl{}

      iex> get_landing_page_url!(456)
      ** (Ecto.NoResultsError)

  """
  def get_landing_page_url!(id), do: Repo.get!(LandingPageUrl, id)

  @doc """
  Creates a landing_page_url.

  ## Examples

      iex> create_landing_page_url(%{field: value})
      {:ok, %LandingPageUrl{}}

      iex> create_landing_page_url(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_landing_page_url(attrs \\ %{}) do
    %LandingPageUrl{}
    |> LandingPageUrl.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a landing_page_url.

  ## Examples

      iex> update_landing_page_url(landing_page_url, %{field: new_value})
      {:ok, %LandingPageUrl{}}

      iex> update_landing_page_url(landing_page_url, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_landing_page_url(%LandingPageUrl{} = landing_page_url, attrs) do
    landing_page_url
    |> LandingPageUrl.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a LandingPageUrl.

  ## Examples

      iex> delete_landing_page_url(landing_page_url)
      {:ok, %LandingPageUrl{}}

      iex> delete_landing_page_url(landing_page_url)
      {:error, %Ecto.Changeset{}}

  """
  def delete_landing_page_url(%LandingPageUrl{} = landing_page_url) do
    Repo.delete(landing_page_url)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking landing_page_url changes.

  ## Examples

      iex> change_landing_page_url(landing_page_url)
      %Ecto.Changeset{source: %LandingPageUrl{}}

  """
  def change_landing_page_url(%LandingPageUrl{} = landing_page_url) do
    LandingPageUrl.changeset(landing_page_url, %{})
  end
end
