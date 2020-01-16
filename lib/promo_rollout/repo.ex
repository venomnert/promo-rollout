defmodule PromoRollout.Repo do
  use Ecto.Repo,
    otp_app: :promo_rollout,
    adapter: Ecto.Adapters.Postgres
end
