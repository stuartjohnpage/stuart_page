defmodule StuartPageLiveWeb.HomeLiveTest do
  use StuartPageLiveWeb.ConnCase

  test "GET / renders home page", %{conn: conn} do
    conn = get(conn, ~p"/")
    response = html_response(conn, 200)
    assert response =~ "Stuart Page"
    assert response =~ "Elixir Hero"
    assert response =~ "Flappy Phoenix"
  end

  test "GET /projects renders projects page", %{conn: conn} do
    conn = get(conn, ~p"/projects")
    response = html_response(conn, 200)
    assert response =~ "Elixir Hero"
    assert response =~ "Unwrapped"
  end

  test "GET /writing renders writing page", %{conn: conn} do
    conn = get(conn, ~p"/writing")
    response = html_response(conn, 200)
    assert response =~ "DeltaQuery"
    assert response =~ "Revelry Insights"
  end
end
