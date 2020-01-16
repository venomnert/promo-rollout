# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :promo_rollout,
  ecto_repos: [PromoRollout.Repo]

# Configures the endpoint
config :promo_rollout, PromoRolloutWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "01mW1Y0b718wph/Y6t9pV82kZxzB8+9TVMWXTbxmflD59HV/PERBCE1sBtr2J6X0",
  render_errors: [view: PromoRolloutWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PromoRollout.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
