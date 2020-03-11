defmodule CachexTutorial.Repo do
  use Ecto.Repo,
    otp_app: :cachex_tutorial,
    adapter: Ecto.Adapters.Postgres
end
