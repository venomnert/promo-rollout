defmodule PromoRollout.Repo.Migrations.LinkedPromoJobToRegion do
  use Ecto.Migration

  def change do
    alter table(:promo_jobs) do
      add(:region_id, references(:regions))
    end
  end
end
