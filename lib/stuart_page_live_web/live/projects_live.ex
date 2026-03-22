defmodule StuartPageLiveWeb.ProjectsLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLive.Content

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       projects: Content.projects(),
       open_source: Content.open_source(),
       page_title: "Projects"
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="projects" phx-hook="ScrollFade">
      <section class="py-16 max-w-5xl mx-auto">
        <div class="mb-12 fade-in">
          <h1 class="text-4xl font-bold mb-2 gradient-text">Projects</h1>
          <p class="text-base-content/60">Things I've built, mostly with Elixir and Phoenix.</p>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 fade-in-children">
          <.project_card :for={project <- @projects} project={project} />
        </div>

        <div class="section-divider my-16"></div>

        <h2 class="text-3xl font-bold mb-10 fade-in">Open Source</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 fade-in-children">
          <.oss_card :for={oss <- @open_source} oss={oss} />
        </div>
      </section>
    </div>
    """
  end
end
