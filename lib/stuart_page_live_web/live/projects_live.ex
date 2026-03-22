defmodule StuartPageLiveWeb.ProjectsLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLiveWeb.Content

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, projects: Content.projects(), page_title: "Projects")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="py-12">
      <h1 class="text-4xl font-bold mb-12">Projects</h1>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <div :for={project <- @projects} class="card bg-base-200 shadow-xl hover:shadow-2xl transition-shadow">
          <div class="card-body">
            <h2 class="card-title">{project.name}</h2>
            <p class="text-base-content/70">{project.description}</p>
            <div class="flex flex-wrap gap-1 mt-2">
              <span :for={tag <- project.tags} class="badge badge-outline badge-sm">{tag}</span>
            </div>
            <div class="card-actions justify-end mt-4">
              <a :if={project[:blog]} href={project.blog} target="_blank" class="btn btn-ghost btn-sm">
                Blog Post
              </a>
              <a href={project.github} target="_blank" class="btn btn-ghost btn-sm">
                Source
              </a>
              <a :if={project.url} href={project.url} target="_blank" class="btn btn-primary btn-sm">
                Live Demo
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
