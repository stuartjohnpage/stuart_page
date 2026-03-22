defmodule StuartPageLiveWeb.PageController do
  use StuartPageLiveWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
