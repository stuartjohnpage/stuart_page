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
    <section class="py-12">
      <h1 class="text-4xl font-bold mb-4">Writing</h1>
      <p class="text-base-content/60 mb-12">
        Blog posts published on
        <a href="https://revelry.co/author/stuart-page/" target="_blank" class="link link-primary">
          Revelry Insights</a>.
      </p>
      <div class="grid grid-cols-1 gap-4">
        <a
          :for={post <- @posts}
          href={post.url}
          target="_blank"
          class="card bg-base-200 shadow hover:shadow-xl transition-shadow"
        >
          <div class="card-body flex-row justify-between items-center py-6">
            <h2 class="card-title text-base">{post.title}</h2>
            <span class="text-base-content/50 text-sm whitespace-nowrap ml-4">{post.date}</span>
          </div>
        </a>
      </div>
    </section>
    """
  end
end
