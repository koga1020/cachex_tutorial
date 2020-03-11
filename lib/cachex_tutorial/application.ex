defmodule CachexTutorial.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      {CachexTutorial.Repo, []},
      %{
        id: :my_cache_id,
        start: {Cachex, :start_link, [:my_cache, []]}
      }
      # Starts a worker by calling: CachexTutorial.Worker.start_link(arg)
      # {CachexTutorial.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CachexTutorial.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
