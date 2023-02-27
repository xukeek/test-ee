defmodule NotionAnnoWeb.Home.ControllerTest do
  use NotionAnnoWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Hello, world!"
  end
end
