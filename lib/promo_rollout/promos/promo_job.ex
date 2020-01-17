defmodule PromoRollout.Promos.PromoJob do
  use Ecto.Schema
  import Ecto.Changeset

  alias PromoRollout.Promos.{LandingPageUrl, Region}

  schema "promo_jobs" do
    field(:banners, :map, default: %{"enhanced_promo_bar" => "", "promo_takeover" => "", "body_promo" => "", "store_slider" => ""})
    field(:draft, :boolean, default: true)
    field(:end_date, :utc_datetime)
    field(:name, :string)
    field(:rolled_out, :boolean, default: false)
    field(:start_date, :utc_datetime)
    field(:take_down, :boolean, default: false)

    has_one(:landing_page_url, LandingPageUrl)
    belongs_to(:region, Region)

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
