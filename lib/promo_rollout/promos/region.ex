defmodule PromoRollout.Promos.Region do
  use Ecto.Schema
  import Ecto.Changeset

  alias PromoRollout.Promos.{PromoJob}

  schema "regions" do
    field(:name, :string)

    has_many(:promos, PromoJob)

    timestamps()
  end

  def changeset(region, attrs) do
    region
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
