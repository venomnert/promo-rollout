defmodule PromoRollout.Repo.Migrations.CreatePromoJobs do
  use Ecto.Migration

  def change do
    create table(:promo_jobs) do
      add(:name, :string)
      add(:rolled_out, :boolean, default: false, null: false)
      add(:take_down, :boolean, default: false, null: false)
      add(:start_date, :utc_datetime)
      add(:end_date, :utc_datetime)
      add(:banners, :map)
      add(:draft, :boolean, default: true, null: false)

      timestamps()
    end
  end
end
