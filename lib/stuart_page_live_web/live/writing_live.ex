defmodule StuartPageLiveWeb.WritingLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLive.Content

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, posts: Content.posts(), page_title: "Writing")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="writing" phx-hook="ScrollFade">
      <section class="py-10 sm:py-16 max-w-3xl mx-auto">
        <div class="mb-8 sm:mb-12 fade-in">
          <h1 class="text-3xl sm:text-4xl font-bold mb-2 gradient-text">Writing</h1>
          
          <p class="text-base-content/60">
            Blog posts published on <a
              href="https://revelry.co/author/stuart-page/"
              target="_blank"
              class="link link-primary"
            >
              Revelry Insights</a>.
          </p>
          
          <p class="text-base-content/50 text-sm mt-3 italic">
            I use AI extensively in my programming, but almost never in my writing.
            Writing is the best way I have have to communicate my thoughts, both to others
            but also to myself, and I feel like running those thoughts through an LLM would dilute them.
          </p>
        </div>
        
        <div class="flex flex-col gap-3 fade-in-children">
          <.post_card :for={post <- @posts} post={post} />
        </div>
      </section>
    </div>
    """
  end
end
