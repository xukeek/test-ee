defmodule NotionAnnoGraphQL.Router do
  use Plug.Router

  defmodule GraphQL do
    use Plug.Router

    plug(:match)
    plug(:dispatch)

    forward("/",
      to: Absinthe.Plug,
      init_opts: [
        json_codec: Jason,
        schema: NotionAnnoGraphQL.Schema
      ]
    )
  end

  plug(NotionAnnoGraphQL.Plugs.Context)

  plug(:match)
  plug(:dispatch)

  forward("/graphql", to: GraphQL)

  match(_, do: conn)
end
