import Config

defmodule TestEnvironment do
  @database_name_suffix "_test"

  def get_database_url do
    url = System.get_env("DATABASE_URL")

    if is_nil(url) || String.ends_with?(url, @database_name_suffix) do
      url
    else
      raise "Expected database URL to end with '#{@database_name_suffix}', got: #{url}"
    end
  end
end

config :notion_anno, NotionAnno.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  url: TestEnvironment.get_database_url()

config :notion_anno, NotionAnnoWeb.Endpoint, server: false

# This config is to output keys instead of translated message in test
config :notion_anno, NotionAnno.Gettext, priv: "priv/null", interpolation: NotionAnno.GettextInterpolation

config :logger, level: :warn
