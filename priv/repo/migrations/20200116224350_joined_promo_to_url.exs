defmodule PromoRollout.Repo.Migrations.JoinedPromoToUrl do
  use Ecto.Migration

  def change do
    alter table(:promo_jobs) do
      add(:landing_page_url_id, references(:landing_page_urls))
    end

    create(unique_index(:promo_jobs, [:landing_page_url_id]))
  end
end
