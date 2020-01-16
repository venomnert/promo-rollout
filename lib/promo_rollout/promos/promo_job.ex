defmodule PromoRollout.Promos.PromoJob do
  use Ecto.Schema
  import Ecto.Changeset

  alias PromoRollout.Promos.LandingPageUrl

  schema "promo_jobs" do
    field(:banners, :map)
    field(:draft, :boolean, default: true)
    field(:end_date, :utc_datetime)
    field(:name, :string)
    field(:rolled_out, :boolean, default: false)
    field(:start_date, :utc_datetime)
    field(:take_down, :boolean, default: false)

    has_one(:url, LandingPageUrl)

    timestamps()
  end

  @doc false
  def changeset(promo_job, attrs) do
    promo_job
    |> cast(attrs, [:name, :rolled_out, :take_down, :start_date, :end_date, :banners, :draft])
    |> validate_required([
      :name,
      :rolled_out,
      :take_down,
      :start_date,
      :end_date,
      :banners,
      :draft
    ])
  end
end
