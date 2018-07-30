use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :worldview, WorldviewWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :worldview, Worldview.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "ipriestley",
  password: "",
  database: "worldview_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
