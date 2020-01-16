defmodule PromoRollout.Promos.LandingPageUrl do
  use Ecto.Schema
  import Ecto.Changeset

  alias PromoRollout.Promos.PromoJob

  schema "landing_page_urls" do
    field(:draft, :boolean, default: true)
    field(:end_date, :utc_datetime)
    field(:redirected, :boolean, default: false)
    field(:url, :string)

    has_one(:promo, PromoJob)

    timestamps()
  end

  @doc false
  def changeset(landing_page_url, attrs) do
    landing_page_url
    |> cast(attrs, [:url, :end_date, :redirected, :draft])
    |> validate_required([:url, :end_date, :redirected, :draft])
  end
end
