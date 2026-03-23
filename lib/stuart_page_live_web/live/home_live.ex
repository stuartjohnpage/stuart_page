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

  attr :name, :string, required: true

  defp tech_badge(assigns) do
    ~H"""
    <span class="badge badge-lg badge-outline border-primary/30 text-base-content/80 gap-1.5 py-3 px-4 font-medium">
      {@name}
    </span>
    """
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="home" phx-hook="ScrollFade">
      <%!-- Hero Section --%>
      <section class="hero min-h-[50vh] sm:min-h-[70vh] bg-base-200 rounded-box my-4 sm:my-8">
        <div class="hero-content flex-col lg:flex-row-reverse gap-8 lg:gap-12 py-10 sm:py-16">
          <div class="profile-ring">
            <img
              src={~p"/images/profile.jpg"}
              class="w-48 h-48 lg:w-64 lg:h-64 rounded-full shadow-2xl object-cover"
              alt="Stuart Page"
            />
          </div>

          <div class="max-w-lg">
            <h1 class="text-3xl sm:text-5xl font-bold gradient-text">Stuart Page</h1>

            <p class="text-lg text-primary font-medium mt-2">
              Software Engineer at
              <a href="https://revelry.co" target="_blank" class="link link-primary">Revelry</a>
            </p>

            <p class="py-4 text-base text-base-content/70 leading-relaxed">
              Originally from the UK, now based in Texas. I build real-time web applications
              with Elixir and Phoenix, and write about AI, security, and whatever else catches my interest.
            </p>

            <div class="flex gap-3 flex-wrap items-center">
              <a href="mailto:stuartjohnpage@live.com" class="btn btn-primary">
                <.icon name="hero-envelope" class="size-5" /> Get in touch
              </a>
              <a
                href="https://github.com/stuartjohnpage"
                target="_blank"
                class="btn btn-ghost btn-circle"
                aria-label="GitHub"
              >
                <svg viewBox="0 0 24 24" class="size-5 fill-current" aria-hidden="true">
                  <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0 0 24 12c0-6.63-5.37-12-12-12Z" />
                </svg>
              </a>
              <a
                href="https://www.linkedin.com/in/stuartjohnpage"
                target="_blank"
                class="btn btn-ghost btn-circle"
                aria-label="LinkedIn"
              >
                <svg viewBox="0 0 24 24" class="size-5 fill-current" aria-hidden="true">
                  <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 0 1-2.063-2.065 2.064 2.064 0 1 1 2.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
                </svg>
              </a>
            </div>
          </div>
        </div>
      </section>

      <div class="section-divider my-4"></div>
      <%!-- Tech Stack --%>
      <section class="py-10 sm:py-16 fade-in">
        <h2 class="text-3xl font-bold mb-8">What I Work With</h2>

        <div class="flex flex-wrap gap-3 fade-in-children">
          <.tech_badge name="Elixir" />
          <.tech_badge name="Phoenix" />
          <.tech_badge name="LiveView" />
          <.tech_badge name="Tailwind CSS" />
          <.tech_badge name="PostgreSQL" />
          <.tech_badge name="AI / LLMs" />
          <.tech_badge name="Python" />
          <.tech_badge name="Docker" />
          <.tech_badge name="Fly.io" />
        </div>
      </section>

      <%!-- About --%>
      <section class="py-12 sm:py-20 fade-in">
        <div class="bg-base-200 rounded-box p-8 sm:p-12 max-w-4xl mx-auto">
          <h2 class="text-3xl font-bold mb-6">A bit about me</h2>

          <div class="space-y-4 text-base-content/80 leading-relaxed text-base">
            <p>
              I studied American history and then psychology at the University of Nottingham, which is
              a perfectly normal pipeline into software engineering if you don't think about
              it too hard. After a bootcamp in New Orleans, I joined
              <a href="https://revelry.co" target="_blank" class="link link-primary">Revelry</a>
              as an apprentice in 2021 and have been there ever since — building everything from
              AI platforms with RAG pipelines to cryptocurrency accountancy tools to the occasional
              game in LiveView.
            </p>

            <p>
              These days I spend most of my time in Elixir and Phoenix, though I've been known
              to try my hand at TypeScript, Python, and whatever else the project demands. I'm a
              peer coach, and have mentored apprentices through Revelry's program, so I guess the
              psychology study wasn't entirely wasted (I'm still waiting on the history though). I've
              spoken at TECNext and GigCityElixir about building AI applications in Elixir.
            </p>

            <p>
              I write regularly on
              <a href="https://revelry.co/author/stuart-page/" target="_blank" class="link link-primary">Revelry's blog</a>
              about AI, security, Elixir, and whatever else I'm thinking about. I use AI
              extensively in my programming, but I try to keep it out of my writing. Writing is the best
              tool I have for stress-testing my own understanding, and running my thoughts through
              an LLM would rather defeat the point..!
            </p>
          </div>
        </div>
      </section>

      <div class="section-divider my-4"></div>
      <%!-- Featured Writing --%>
      <section class="py-10 sm:py-16 fade-in">
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
      <section class="py-10 sm:py-16 fade-in">
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
      <section class="py-10 sm:py-16 fade-in">
        <h2 class="text-3xl font-bold mb-10">Open Source</h2>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 fade-in-children">
          <.oss_card :for={oss <- @open_source} oss={oss} />
        </div>
      </section>

      <div class="section-divider my-4"></div>
      <%!-- Mowgli --%>
      <section class="py-10 sm:py-16 fade-in">
        <h2 class="text-3xl font-bold text-center mb-12">Cat</h2>

        <div class="max-w-sm mx-auto">
          <div class="card bg-base-200 card-glow">
            <figure class="px-4 pt-4">
              <img
                src={~p"/images/mowgli.jpg"}
                alt="Mowgli the cat"
                class="rounded-xl object-cover h-72 w-full"
              />
            </figure>

            <div class="card-body items-center text-center">
              <h3 class="card-title">
                This is Mowgli who produced all of this code by *not* walking on my keyboard
              </h3>
            </div>
          </div>
        </div>
      </section>
      <%!-- Footer --%>
      <footer class="footer footer-center p-10 mt-8 text-base-content/60 border-t border-base-200">
        <div class="flex gap-4">
          <a
            href="https://github.com/stuartjohnpage"
            target="_blank"
            class="btn btn-ghost btn-circle btn-sm"
            aria-label="GitHub"
          >
            <svg viewBox="0 0 24 24" class="size-5 fill-current" aria-hidden="true">
              <path d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0 0 24 12c0-6.63-5.37-12-12-12Z" />
            </svg>
          </a>
          <a
            href="https://www.linkedin.com/in/stuartjohnpage"
            target="_blank"
            class="btn btn-ghost btn-circle btn-sm"
            aria-label="LinkedIn"
          >
            <svg viewBox="0 0 24 24" class="size-5 fill-current" aria-hidden="true">
              <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 0 1-2.063-2.065 2.064 2.064 0 1 1 2.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z" />
            </svg>
          </a>
          <a
            href="mailto:stuartjohnpage@live.com"
            class="btn btn-ghost btn-circle btn-sm"
            aria-label="Email"
          >
            <.icon name="hero-envelope" class="size-5" />
          </a>
        </div>

        <div class="flex flex-col gap-1">
          <p>
            Built with
            <a href="https://phoenixframework.org" target="_blank" class="link link-hover">Phoenix</a>
            & <a href="https://elixir-lang.org" target="_blank" class="link link-hover">Elixir</a>
          </p>
          <p class="text-sm text-base-content/40">&copy; {DateTime.utc_now().year} Stuart Page</p>
        </div>
      </footer>
    </div>
    """
  end
end
