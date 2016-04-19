defmodule UrlTonic.CanonV1ControllerTest do
  use UrlTonic.ConnCase

  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "returns an error for blank urls", %{conn: conn} do
    conn = get conn, canon_v1_path(conn, :process_url, %{url: ""})
    refute json_response(conn, 200)["error"] == ""
  end

  test "returns proper canonical url for given input", %{conn: conn} do
    conn = get conn, canon_v1_path(conn, :process_url, %{url: "http://www.example.com"})
    assert json_response(conn, 200)["canonical"] == "http://example.com"
  end

end
