defmodule StuartPageLiveWeb.Router do
  use StuartPageLiveWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {StuartPageLiveWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", StuartPageLiveWeb do
    pipe_through :browser

    live "/", HomeLive
    live "/projects", ProjectsLive
    live "/writing", WritingLive
  end
end
