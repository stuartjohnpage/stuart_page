defmodule StuartPageLiveWeb.ProjectsLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLiveWeb.Content

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
        <div
          :for={project <- @projects}
          class="card bg-base-200 shadow-xl hover:shadow-2xl hover:-translate-y-1 transition-all duration-200"
        >
          <div class="card-body">
            <h2 class="card-title">{project.name}</h2>
            <p class="text-base-content/70 leading-relaxed">{project.description}</p>
            <div class="card-actions justify-end mt-6 pt-4 border-t border-base-300">
              <a :if={project[:blog]} href={project.blog} target="_blank" class="btn btn-ghost btn-sm">
                Blog Post
              </a>
              <a href={project.github} target="_blank" class="btn btn-ghost btn-sm">
                Source
              </a>
              <a :if={project.url} href={project.url} target="_blank" class="btn btn-primary btn-sm">
                Live Demo <.icon name="hero-arrow-top-right-on-square-mini" class="size-3.5" />
              </a>
            </div>
          </div>
        </div>
      </div>

      <h2 class="text-3xl font-bold mt-20 mb-10">Open Source</h2>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <div
          :for={oss <- @open_source}
          class="card bg-base-200 shadow-xl hover:shadow-2xl hover:-translate-y-1 transition-all duration-200"
        >
          <div class="card-body">
            <div class="flex items-center gap-3">
              <h2 class="card-title">{oss.name}</h2>
              <div class="badge badge-primary badge-sm gap-1">
                <svg viewBox="0 0 16 16" class="size-3 fill-current" aria-hidden="true">
                  <path d="M8 .25a.75.75 0 0 1 .673.418l1.882 3.815 4.21.612a.75.75 0 0 1 .416 1.279l-3.046 2.97.719 4.192a.75.75 0 0 1-1.088.791L8 12.347l-3.766 1.98a.75.75 0 0 1-1.088-.79l.72-4.194L.818 6.374a.75.75 0 0 1 .416-1.28l4.21-.611L7.327.668A.75.75 0 0 1 8 .25Z" />
                </svg>
                {oss.stars}
              </div>
            </div>
            <p class="text-base-content/70 leading-relaxed">{oss.description}</p>
            <div class="card-actions justify-end mt-6 pt-4 border-t border-base-300">
              <a :if={oss[:blog]} href={oss.blog} target="_blank" class="btn btn-ghost btn-sm">
                Blog Post
              </a>
              <a href={oss.hex} target="_blank" class="btn btn-ghost btn-sm">
                Hex.pm
              </a>
              <a href={oss.github} target="_blank" class="btn btn-ghost btn-sm">
                Source
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
