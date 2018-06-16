# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :aske,
  ecto_repos: [Aske.Repo]

# Configures the endpoint
config :aske, AskeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JvkyXEcufAwbF8sCnXIM785lg3Olshr9LOYKegz7NUP3aJQtYcejsJcC74IImGXX",
  render_errors: [view: AskeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Aske.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :phoenix, :template_engines,
  drab: Drab.Live.Engine
