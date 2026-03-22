defmodule StuartPageLiveWeb.WritingLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLiveWeb.Content

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, posts: Content.posts(), page_title: "Writing")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="py-16 max-w-3xl mx-auto">
      <div class="mb-12">
        <h1 class="text-4xl font-bold mb-2">Writing</h1>
        <p class="text-base-content/60">
          Blog posts published on
          <a href="https://revelry.co/author/stuart-page/" target="_blank" class="link link-primary">
            Revelry Insights</a>.
        </p>
      </div>
      <div class="flex flex-col gap-3">
        <a
          :for={post <- @posts}
          href={post.url}
          target="_blank"
          class="group card bg-base-200 shadow hover:shadow-xl hover:-translate-y-0.5 transition-all duration-200"
        >
          <div class="card-body flex-row justify-between items-center py-5 gap-4">
            <h2 class="font-medium group-hover:text-primary transition-colors">{post.title}</h2>
            <span class="text-base-content/40 text-sm whitespace-nowrap">{post.date}</span>
          </div>
        </a>
      </div>
    </section>
    """
  end
end
