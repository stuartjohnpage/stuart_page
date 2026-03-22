defmodule StuartPageLiveWeb.HomeLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLiveWeb.Content

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       projects: Content.featured_projects(),
       open_source: Content.open_source(),
       posts: Content.featured_posts(),
       page_title: "Stuart Page"
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <%!-- Hero Section --%>
    <section class="hero min-h-[70vh] bg-base-200 rounded-box my-8">
      <div class="hero-content flex-col lg:flex-row-reverse gap-12 py-16">
        <img
          src={~p"/images/profile.jpg"}
          class="w-48 h-48 lg:w-64 lg:h-64 rounded-full shadow-2xl ring-4 ring-primary/20 object-cover"
          alt="Stuart Page"
        />
        <div class="max-w-lg">
          <h1 class="text-5xl font-bold">Stuart Page</h1>
          <p class="py-6 text-lg text-base-content/70 leading-relaxed">
            Software engineer and AI enthusiast at
            <a href="https://revelry.co" target="_blank" class="link link-primary">Revelry</a>
            since 2021. Originally from the UK, now based in Texas. I build real-time web applications
            with Elixir and Phoenix, and write about AI, security, and whatever else catches my interest.
          </p>
          <div class="flex gap-3 flex-wrap">
            <a href="mailto:stuartjohnpage@live.com" class="btn btn-primary">
              <.icon name="hero-envelope" class="size-5" /> Get in touch
            </a>
          </div>
        </div>
      </div>
    </section>

    <%!-- Featured Writing --%>
    <section class="py-16">
      <div class="flex justify-between items-center mb-10">
        <h2 class="text-3xl font-bold">Writing</h2>
        <.link navigate={~p"/writing"} class="btn btn-ghost btn-sm">
          View all <.icon name="hero-arrow-right-mini" class="size-4" />
        </.link>
      </div>
      <div class="flex flex-col gap-3">
        <a
          :for={post <- @posts}
          href={post.url}
          target="_blank"
          class="group card bg-base-200 shadow hover:shadow-xl hover:-translate-y-0.5 transition-all duration-200"
        >
          <div class="card-body flex-row justify-between items-center py-5 gap-4">
            <h3 class="font-medium group-hover:text-primary transition-colors">{post.title}</h3>
            <span class="text-base-content/40 text-sm whitespace-nowrap">{post.date}</span>
          </div>
        </a>
      </div>
    </section>

    <%!-- Featured Projects --%>
    <section class="py-16">
      <div class="flex justify-between items-center mb-10">
        <h2 class="text-3xl font-bold">Projects</h2>
        <.link navigate={~p"/projects"} class="btn btn-ghost btn-sm">
          View all <.icon name="hero-arrow-right-mini" class="size-4" />
        </.link>
      </div>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
        <.project_card :for={project <- @projects} project={project} />
      </div>
    </section>

    <%!-- Open Source --%>
    <section class="py-16">
      <h2 class="text-3xl font-bold mb-10">Open Source</h2>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
        <div
          :for={oss <- @open_source}
          class="card bg-base-200 shadow-xl hover:shadow-2xl hover:-translate-y-1 transition-all duration-200"
        >
          <div class="card-body">
            <div class="flex items-center gap-3">
              <h3 class="card-title">{oss.name}</h3>
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

    <%!-- Mowgli --%>
    <section class="py-16">
      <h2 class="text-3xl font-bold text-center mb-12">The Real Star</h2>
      <div class="max-w-sm mx-auto">
        <div class="card bg-base-200 shadow-xl hover:shadow-2xl hover:-translate-y-1 transition-all duration-200">
          <figure class="px-4 pt-4">
            <img src={~p"/images/mowgli.jpg"} alt="Mowgli the cat" class="rounded-xl object-cover h-72 w-full" />
          </figure>
          <div class="card-body items-center text-center">
            <h3 class="card-title">Mowgli</h3>
          </div>
        </div>
      </div>
    </section>

    <%!-- Footer --%>
    <footer class="footer footer-center p-10 mt-8 text-base-content/60 border-t border-base-200">
      <div>
        <p>
          Built with
          <a href="https://phoenixframework.org" target="_blank" class="link link-hover">Phoenix</a>
          &
          <a href="https://elixir-lang.org" target="_blank" class="link link-hover">Elixir</a>
          — because of course it is.
        </p>
      </div>
    </footer>
    """
  end

  defp project_card(assigns) do
    ~H"""
    <div class="card bg-base-200 shadow-xl hover:shadow-2xl hover:-translate-y-1 transition-all duration-200">
      <div class="card-body">
        <h3 class="card-title">{@project.name}</h3>
        <p class="text-base-content/70 leading-relaxed">{@project.description}</p>
        <div class="card-actions justify-end mt-6 pt-4 border-t border-base-300">
          <a :if={@project[:blog]} href={@project.blog} target="_blank" class="btn btn-ghost btn-sm">
            Blog Post
          </a>
          <a href={@project.github} target="_blank" class="btn btn-ghost btn-sm">
            Source
          </a>
          <a :if={@project.url} href={@project.url} target="_blank" class="btn btn-primary btn-sm">
            Live Demo <.icon name="hero-arrow-top-right-on-square-mini" class="size-3.5" />
          </a>
        </div>
      </div>
    </div>
    """
  end
end
