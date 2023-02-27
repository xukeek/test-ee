import Config

version = Mix.Project.config()[:version]

config :notion_anno,
  ecto_repos: [NotionAnno.Repo],
  version: version

config :phoenix, :json_library, Jason

config :notion_anno, NotionAnnoWeb.Endpoint,
  pubsub_server: NotionAnno.PubSub,
  render_errors: [view: NotionAnnoWeb.Errors.View, accepts: ~w(html json)]

config :notion_anno, NotionAnno.Repo, start_apps_before_migration: [:ssl]

config :notion_anno, Corsica, allow_headers: :all

config :notion_anno, NotionAnno.Gettext, default_locale: "en"

config :notion_anno, NotionAnnoWeb.Plus.Security, allow_unsafe_scripts: false

config :esbuild,
  version: "0.14.41",
  default: [
    args: ~w(js/app.js --bundle --target=es2016 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :sentry,
  root_source_code_path: File.cwd!(),
  release: version

config :logger, backends: [:console, Sentry.LoggerBackend]

# Import environment configuration
import_config "#{Mix.env()}.exs"
