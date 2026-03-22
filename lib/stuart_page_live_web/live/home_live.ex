defmodule StuartPageLiveWeb.HomeLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLive.Content

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
    <div id="home" phx-hook="ScrollFade">
      <%!-- Hero Section --%>
      <section class="hero min-h-[70vh] bg-base-200 rounded-box my-8">
        <div class="hero-content flex-col lg:flex-row-reverse gap-12 py-16">
          <div class="profile-ring">
            <img
              src={~p"/images/profile.jpg"}
              class="w-48 h-48 lg:w-64 lg:h-64 rounded-full shadow-2xl object-cover"
              alt="Stuart Page"
            />
          </div>
          <div class="max-w-lg">
            <h1 class="text-5xl font-bold gradient-text">Stuart Page</h1>
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

      <div class="section-divider my-4"></div>

      <%!-- Featured Writing --%>
      <section class="py-16 fade-in">
        <div class="flex justify-between items-center mb-10">
          <h2 class="text-3xl font-bold">Writing</h2>
          <.link navigate={~p"/writing"} class="btn btn-ghost btn-sm">
            View all <.icon name="hero-arrow-right-mini" class="size-4" />
          </.link>
        </div>
        <div class="flex flex-col gap-3 fade-in-children">
          <.post_card :for={post <- @posts} post={post} />
        </div>
      </section>

      <div class="section-divider my-4"></div>

      <%!-- Featured Projects --%>
      <section class="py-16 fade-in">
        <div class="flex justify-between items-center mb-10">
          <h2 class="text-3xl font-bold">Projects</h2>
          <.link navigate={~p"/projects"} class="btn btn-ghost btn-sm">
            View all <.icon name="hero-arrow-right-mini" class="size-4" />
          </.link>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 fade-in-children">
          <.project_card :for={project <- @projects} project={project} />
        </div>
      </section>

      <div class="section-divider my-4"></div>

      <%!-- Open Source --%>
      <section class="py-16 fade-in">
        <h2 class="text-3xl font-bold mb-10">Open Source</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 fade-in-children">
          <.oss_card :for={oss <- @open_source} oss={oss} />
        </div>
      </section>

      <div class="section-divider my-4"></div>

      <%!-- Mowgli --%>
      <section class="py-16 fade-in">
        <h2 class="text-3xl font-bold text-center mb-12">Cat</h2>
        <div class="max-w-sm mx-auto">
          <div class="card bg-base-200 card-glow">
            <figure class="px-4 pt-4">
              <img src={~p"/images/mowgli.jpg"} alt="Mowgli the cat" class="rounded-xl object-cover h-72 w-full" />
            </figure>
            <div class="card-body items-center text-center">
              <h3 class="card-title">This is Mowgli who produced all of this code by *not* walking on my keyboard</h3>
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
          </p>
        </div>
      </footer>
    </div>
    """
  end
end
