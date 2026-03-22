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
    <section class="py-16 max-w-5xl mx-auto">
      <div class="mb-12">
        <h1 class="text-4xl font-bold mb-2">Projects</h1>
        <p class="text-base-content/60">Things I've built, mostly with Elixir and Phoenix.</p>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <.project_card :for={project <- @projects} project={project} />
      </div>

      <h2 class="text-3xl font-bold mt-20 mb-10">Open Source</h2>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <.oss_card :for={oss <- @open_source} oss={oss} />
      </div>
    </section>
    """
  end
end
