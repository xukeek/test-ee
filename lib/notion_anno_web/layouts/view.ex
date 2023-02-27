defmodule NotionAnnoWeb.Layouts.View do
  use Phoenix.View, root: "lib/notion_anno_web", path: "layouts/templates", namespace: NotionAnnoWeb
  use Phoenix.HTML

  import Phoenix.Controller, only: [get_flash: 2]

  alias NotionAnnoWeb.Router.Helpers, as: Routes
end
