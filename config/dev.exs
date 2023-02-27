import Config

config :notion_anno, NotionAnnoWeb.Endpoint,
  code_reloader: true,
  check_origin: false,
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--sourcemap=inline --watch)]}
  ],
  live_reload: [
    patterns: [
      ~r{priv/gettext/.*$},
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{lib/notion_anno_web/.*(ee?x)$}
    ]
  ]

config :notion_anno, NotionAnnoWeb.Plugs.Security, allow_unsafe_scripts: true

config :logger, :console, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20
