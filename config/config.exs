# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :worldview,
  ecto_repos: [Worldview.Repo]

# Configures the endpoint
config :worldview, WorldviewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2m6xdeFkcCHf8B0ELVhKTHoMn46E4k6tpQX1N82emDfH70dXUYxsIQWq0obyY8h8",
  render_errors: [view: WorldviewWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Worldview.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
