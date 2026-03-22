defmodule StuartPageLiveWeb.HomeLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLiveWeb.Content

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       projects: Content.featured_projects(),
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
            <a href="https://github.com/stuartjohnpage" target="_blank" class="btn btn-primary">
              <svg viewBox="0 0 24 24" class="size-5 fill-current" aria-hidden="true">
                <path d="M12 0C5.37 0 0 5.506 0 12.303c0 5.445 3.435 10.043 8.205 11.674.6.107.825-.262.825-.585 0-.292-.015-1.261-.015-2.291C6 21.67 5.22 20.346 4.98 19.654c-.135-.354-.72-1.446-1.23-1.738-.42-.23-1.02-.8-.015-.815.945-.015 1.62.892 1.845 1.261 1.08 1.86 2.805 1.338 3.495 1.015.105-.8.42-1.338.765-1.645-2.67-.308-5.46-1.37-5.46-6.075 0-1.338.465-2.446 1.23-3.307-.12-.308-.54-1.569.12-3.26 0 0 1.005-.323 3.3 1.26.96-.276 1.98-.415 3-.415s2.04.139 3 .416c2.295-1.6 3.3-1.261 3.3-1.261.66 1.691.24 2.952.12 3.26.765.861 1.23 1.953 1.23 3.307 0 4.721-2.805 5.767-5.475 6.075.435.384.81 1.122.81 2.276 0 1.645-.015 2.968-.015 3.383 0 .323.225.707.825.585a12.047 12.047 0 0 0 5.919-4.489A12.536 12.536 0 0 0 24 12.304C24 5.505 18.63 0 12 0Z" />
              </svg>
              GitHub
            </a>
            <a href="https://www.linkedin.com/in/stuartjohnpage" target="_blank" class="btn btn-outline">
              <svg viewBox="0 0 24 24" class="size-5 fill-current" aria-hidden="true">
                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 0 1-2.063-2.065 2.064 2.064 0 1 1 2.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
              </svg>
              LinkedIn
            </a>
            <a href="mailto:stuartjohnpage@live.com" class="btn btn-outline">
              <.icon name="hero-envelope" class="size-5" /> Contact
            </a>
          </div>
        </div>
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
        <div
          :for={project <- @projects}
          class="card bg-base-200 shadow-xl hover:shadow-2xl hover:-translate-y-1 transition-all duration-200"
        >
          <div class="card-body">
            <h3 class="card-title">{project.name}</h3>
            <p class="text-base-content/70 leading-relaxed">{project.description}</p>
            <div class="flex flex-wrap gap-1.5 mt-3">
              <span :for={tag <- project.tags} class="badge badge-outline badge-sm">{tag}</span>
            </div>
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

    <%!-- Cats Section --%>
    <section class="py-16">
      <h2 class="text-3xl font-bold text-center mb-12">The Real Stars</h2>
      <div class="grid grid-cols-1 sm:grid-cols-2 gap-8 max-w-2xl mx-auto">
        <div class="card bg-base-200 shadow-xl hover:shadow-2xl hover:-translate-y-1 transition-all duration-200">
          <figure class="px-4 pt-4">
            <img src={~p"/images/mowgli.jpg"} alt="Mowgli the cat" class="rounded-xl object-cover h-64 w-full" />
          </figure>
          <div class="card-body items-center text-center">
            <h3 class="card-title">Mowgli</h3>
          </div>
        </div>
        <div class="card bg-base-200 shadow-xl hover:shadow-2xl hover:-translate-y-1 transition-all duration-200">
          <figure class="px-4 pt-4">
            <img src={~p"/images/max.jpg"} alt="Max the cat" class="rounded-xl object-cover h-64 w-full" />
          </figure>
          <div class="card-body items-center text-center">
            <h3 class="card-title">Max</h3>
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
end
