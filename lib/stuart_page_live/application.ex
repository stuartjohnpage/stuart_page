defmodule StuartPageLive.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StuartPageLiveWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:stuart_page_live, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: StuartPageLive.PubSub},
      # Start a worker by calling: StuartPageLive.Worker.start_link(arg)
      # {StuartPageLive.Worker, arg},
      # Start to serve requests, typically the last entry
      StuartPageLiveWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StuartPageLive.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StuartPageLiveWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
