defmodule NotionAnno.Application do
  @moduledoc """
  Main entry point of the app
  """

  use Application

  def start(_type, _args) do
    children = [
      NotionAnno.Repo,
      {Phoenix.PubSub, [name: NotionAnno.PubSub, adapter: Phoenix.PubSub.PG2]},
      NotionAnnoWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: NotionAnno.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    NotionAnnoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
