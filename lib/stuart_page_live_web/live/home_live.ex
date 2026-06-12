defmodule StuartPageLiveWeb.HomeLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLive.Content

  @toolkit [
    "Elixir",
    "Phoenix",
    "LiveView",
    "Tailwind CSS",
    "PostgreSQL",
    "AI / LLMs",
    "Python",
    "Docker",
    "Fly.io"
  ]

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       projects: Content.featured_projects(),
       open_source: Content.open_source(),
       posts: Content.featured_posts(),
       toolkit: @toolkit,
       page_title: "Stuart Page"
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="home" phx-hook="ScrollFade">
      <%!-- Front page --%>
      <section class="pt-10 sm:pt-14">
        <p class="rise rise-1 flex justify-between border-b border-base-content/20 pb-3 font-mono text-[11px] uppercase tracking-[0.2em] text-base-content/55">
          <span>Vol. VI · Texas, by way of the UK</span>
          <span class="hidden sm:inline">Software &amp; Writing</span>
        </p>

        <div class="grid items-center gap-10 pt-10 sm:pt-14 lg:grid-cols-[1fr_auto] lg:gap-16">
          <div>
            <h1 class="rise rise-2 font-display text-[2.75rem] font-semibold leading-[1.05] tracking-tight sm:text-6xl lg:text-7xl">
              Software engineer<br />
              <em class="font-light italic text-primary">&amp;</em>
              occasional writer<span class="text-primary">.</span>
            </h1>

            <p class="rise rise-3 prose-ed mt-6 max-w-xl text-lg leading-relaxed text-base-content/75 sm:text-xl">
              I'm Stuart Page. I build real-time web applications with Elixir &amp; Phoenix at <a
                href="https://revelry.co"
                target="_blank"
              >Revelry</a>, and write about AI,
              security, and whatever else catches my interest.
            </p>

            <div class="rise rise-4 mt-8 flex flex-wrap items-center gap-x-7 gap-y-4">
              <a href="mailto:stuartjohnpage@live.com" class="btn-ink">
                <.icon name="hero-envelope-micro" class="size-4" /> Get in touch
              </a>
              <.ed_link href="https://github.com/stuartjohnpage" target="_blank">
                GitHub <.icon name="hero-arrow-up-right-micro" class="size-3" />
              </.ed_link>
              <.ed_link href="https://www.linkedin.com/in/stuartjohnpage" target="_blank">
                LinkedIn <.icon name="hero-arrow-up-right-micro" class="size-3" />
              </.ed_link>
            </div>
          </div>

          <figure class="rise rise-5 m-2 justify-self-center lg:justify-self-end">
            <img
              src={~p"/images/profile.jpg"}
              alt="Stuart Page"
              class="img-print img-plate h-64 w-56 object-cover sm:h-72 sm:w-64 lg:h-80 lg:w-72"
            />
            <figcaption class="mt-4 flex justify-between font-mono text-[10px] uppercase tracking-[0.18em] text-base-content/50">
              <span>Fig. 1</span> <span>The author</span>
            </figcaption>
          </figure>
        </div>

        <p class="rise rise-6 mt-12 border-t border-base-content/20 pt-3 text-right font-mono text-[10px] uppercase tracking-[0.18em] text-base-content/40">
          Printed in Texas
        </p>
      </section>

      <%!-- About --%>
      <section class="fade-in py-12 sm:py-16">
        <.section_heading number="No. 01" title="About the author" />
        <div class="grid gap-10 lg:grid-cols-[5fr_2fr] lg:gap-14">
          <div class="prose-ed max-w-prose space-y-5 text-[17px] leading-[1.85] text-base-content/85">
            <p class="has-dropcap">
              I studied American history and then psychology at the University of Nottingham, which is
              a perfectly normal pipeline into software engineering if you don't think about
              it too hard. After a bootcamp in New Orleans, I joined
              <a href="https://revelry.co" target="_blank">Revelry</a>
              as an apprentice in 2021 and have been there ever since, building everything from
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
              <a href="https://revelry.co/author/stuart-page/" target="_blank">Revelry's blog</a>
              about AI, security, Elixir, and whatever else I'm thinking about. I use AI
              extensively in my programming, but I try to keep it out of my writing. Writing is the best
              tool I have for stress-testing my own understanding, and running my thoughts through
              an LLM would rather defeat the point..!
            </p>
          </div>

          <aside class="border-t border-base-content/15 pt-8 lg:border-l lg:border-t-0 lg:pl-8 lg:pt-0">
            <h3 class="mb-5 font-mono text-[11px] uppercase tracking-[0.2em] text-base-content/50">
              In the toolbox
            </h3>

            <ul class="space-y-2.5 font-mono text-sm text-base-content/80">
              <li :for={tool <- @toolkit} class="flex items-baseline gap-3">
                <span class="text-primary">·</span> {tool}
              </li>
            </ul>
          </aside>
        </div>
      </section>

      <%!-- Writing --%>
      <section class="fade-in py-12 sm:py-16">
        <.section_heading number="No. 02" title="Writing">
          <:aside>
            <.ed_link navigate={~p"/writing"}>
              Full index <.icon name="hero-arrow-right-micro" class="size-3" />
            </.ed_link>
          </:aside>
        </.section_heading>

        <div class="fade-in-children flex flex-col">
          <.post_card
            :for={{post, i} <- Enum.with_index(@posts, 1)}
            post={post}
            index={String.pad_leading("#{i}", 2, "0")}
          />
        </div>
      </section>

      <%!-- Projects --%>
      <section class="fade-in py-12 sm:py-16">
        <.section_heading number="No. 03" title="Projects">
          <:aside>
            <.ed_link navigate={~p"/projects"}>
              All projects <.icon name="hero-arrow-right-micro" class="size-3" />
            </.ed_link>
          </:aside>
        </.section_heading>

        <div class="fade-in-children grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
          <.project_card
            :for={{project, i} <- Enum.with_index(@projects, 1)}
            project={project}
            index={String.pad_leading("#{i}", 2, "0")}
          />
        </div>
      </section>

      <%!-- Open Source --%>
      <section class="fade-in py-12 sm:py-16">
        <.section_heading number="No. 04" title="Open Source" />
        <div class="fade-in-children grid gap-6 md:grid-cols-2">
          <.oss_card
            :for={{oss, i} <- Enum.with_index(@open_source, 1)}
            oss={oss}
            index={String.pad_leading("#{i}", 2, "0")}
          />
        </div>
      </section>

      <%!-- Mowgli --%>
      <section class="fade-in py-12 sm:py-16">
        <.section_heading number="Appendix A" title="The Cat" />
        <div class="mx-auto max-w-sm -rotate-1 transition-transform duration-500 hover:rotate-0">
          <figure class="ed-card border border-base-content/25 bg-base-100 p-4">
            <img
              src={~p"/images/mowgli.jpg"}
              alt="Mowgli the cat"
              class="img-print h-80 w-full border border-base-content/20 object-cover"
            />
            <figcaption class="pb-1 pt-4 text-center text-sm italic leading-relaxed text-base-content/70">
              Fig. 2: Mowgli, who produced all of this code by
              <span class="font-semibold not-italic">not</span>
              walking on the keyboard.
            </figcaption>
          </figure>
        </div>
      </section>
    </div>
    """
  end
end
