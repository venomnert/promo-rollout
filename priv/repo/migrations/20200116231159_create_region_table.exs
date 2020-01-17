defmodule PromoRollout.Repo.Migrations.CreateRegionTable do
  use Ecto.Migration

  def change do
    create table(:regions) do
      add(:name, :string)

      add(:promo_job_id, references(:promo_jobs))

      timestamps()
    end
  end
end
