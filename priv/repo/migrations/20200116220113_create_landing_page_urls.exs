defmodule PromoRollout.Repo.Migrations.CreateLandingPageUrls do
  use Ecto.Migration

  def change do
    create table(:landing_page_urls) do
      add(:url, :string)
      add(:end_date, :utc_datetime)
      add(:redirected, :boolean, default: false, null: false)
      add(:draft, :boolean, default: true, null: false)

      add(:promo_job_id, references(:promo_jobs))

      timestamps()
    end
  end
end
