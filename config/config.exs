import Config

config :cachex_tutorial,
  ecto_repos: [CachexTutorial.Repo]

config :cachex_tutorial, CachexTutorial.Repo,
  database: System.fetch_env!("POSTGRES_DB"),
  username: System.fetch_env!("POSTGRES_USER"),
  password: System.fetch_env!("POSTGRES_PASSWORD"),
  hostname: "localhost",
  port: System.fetch_env!("POSTGRES_PORT")
