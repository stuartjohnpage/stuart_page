defmodule StuartPageLiveWeb.ProjectsLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLive.Content

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       projects: Content.projects(),
       open_source: Content.open_source(),
       page_title: "Projects · Stuart Page"
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="projects" phx-hook="ScrollFade">
      <section class="py-10 sm:py-14">
        <header class="mb-10 sm:mb-14">
          <p class="rise rise-1 border-b border-base-content/20 pb-3 font-mono text-[11px] uppercase tracking-[0.2em] text-base-content/55">
            Stuart Page · Index of works
          </p>

          <h1 class="rise rise-2 mt-8 font-display text-4xl font-semibold tracking-tight sm:text-5xl">
            Projects<span class="text-primary">.</span>
          </h1>

          <p class="rise rise-3 mt-4 text-lg italic text-base-content/70">
            Things I've built, mostly with Elixir and Phoenix.
          </p>
        </header>

        <div class="fade-in-children grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          <.project_card
            :for={{project, i} <- Enum.with_index(@projects, 1)}
            project={project}
            index={String.pad_leading("#{i}", 2, "0")}
          />
        </div>

        <div class="fade-in mt-16 sm:mt-20">
          <.section_heading number="No. 02" title="Open Source" />
          <div class="fade-in-children grid gap-6 md:grid-cols-2">
            <.oss_card
              :for={{oss, i} <- Enum.with_index(@open_source, 1)}
              oss={oss}
              index={String.pad_leading("#{i}", 2, "0")}
            />
          </div>
        </div>
      </section>
    </div>
    """
  end
end
