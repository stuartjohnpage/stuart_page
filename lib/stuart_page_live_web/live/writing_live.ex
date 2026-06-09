defmodule StuartPageLiveWeb.WritingLive do
  use StuartPageLiveWeb, :live_view

  alias StuartPageLive.Content

  @impl true
  def mount(_params, _session, socket) do
    posts = Content.posts()

    {:ok,
     assign(socket,
       post_count: length(posts),
       posts_by_year: group_by_year(posts),
       page_title: "Writing · Stuart Page"
     )}
  end

  # Groups posts into {year, [{post, "01"}, ...]} chunks, preserving order
  # and numbering continuously across years like a running index.
  defp group_by_year(posts) do
    posts
    |> Enum.with_index(1)
    |> Enum.chunk_by(fn {post, _index} -> year_of(post) end)
    |> Enum.map(fn [{first, _} | _] = chunk ->
      entries =
        Enum.map(chunk, fn {post, index} ->
          {post, String.pad_leading("#{index}", 2, "0")}
        end)

      {year_of(first), entries}
    end)
  end

  defp year_of(%{date: date}), do: date |> String.split(" ") |> List.last()

  @impl true
  def render(assigns) do
    ~H"""
    <div id="writing" phx-hook="ScrollFade">
      <section class="mx-auto max-w-3xl py-10 sm:py-14">
        <header class="mb-8 sm:mb-12">
          <p class="rise rise-1 flex justify-between border-b border-base-content/20 pb-3 font-mono text-[11px] uppercase tracking-[0.2em] text-base-content/55">
            <span>Stuart Page — Complete index</span>
            <span class="hidden sm:inline">{@post_count} posts</span>
          </p>

          <h1 class="rise rise-2 mt-8 font-display text-4xl font-semibold tracking-tight sm:text-5xl">
            Writing<span class="text-primary">.</span>
          </h1>

          <p class="rise rise-3 prose-ed mt-4 text-lg italic text-base-content/70">
            Blog posts published on <a href="https://revelry.co/author/stuart-page/" target="_blank">Revelry Insights</a>.
          </p>

          <aside class="rise rise-4 mt-6 max-w-2xl border-l-2 border-primary/60 pl-5">
            <p class="text-[15px] italic leading-relaxed text-base-content/70">
              <span class="font-mono text-[10px] uppercase not-italic tracking-[0.18em] text-primary">
                Editor's note —
              </span>
              I use AI extensively in my programming, but almost never in my writing. Writing is how
              I communicate my thoughts, to others and to myself, and running them through an LLM
              would dilute them.
            </p>
          </aside>
        </header>

        <div :for={{year, entries} <- @posts_by_year} class="fade-in">
          <div class="mb-3 mt-10 flex items-center gap-4 first:mt-4">
            <span class="font-mono text-xs tracking-[0.2em] text-primary">{year}</span>
            <span class="h-px flex-1 bg-base-content/15"></span>
          </div>

          <div class="fade-in-children flex flex-col">
            <.post_card :for={{post, index} <- entries} post={post} index={index} />
          </div>
        </div>
      </section>
    </div>
    """
  end
end
