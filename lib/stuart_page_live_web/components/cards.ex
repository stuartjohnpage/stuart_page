defmodule StuartPageLiveWeb.Cards do
  @moduledoc """
  Editorial components — section headings, index rows with dot leaders,
  and plate-style cards for projects and open source work.
  """
  use Phoenix.Component

  import StuartPageLiveWeb.CoreComponents, only: [icon: 1]

  @doc """
  A numbered section heading framed by a strong overline and a hairline,
  like a periodical section divider. The optional `:aside` slot renders
  flush-right (e.g. a "Full index" link).
  """
  attr :number, :string, required: true
  attr :title, :string, required: true

  slot :aside

  def section_heading(assigns) do
    ~H"""
    <div class="mb-10 flex items-end justify-between gap-4 border-t-2 border-t-base-content/90 border-b border-b-base-content/15 pt-4 pb-4">
      <h2 class="flex flex-col gap-1.5">
        <span class="font-mono text-[11px] uppercase tracking-[0.2em] text-primary">{@number}</span>
        <span class="font-display text-3xl font-semibold tracking-tight sm:text-4xl">{@title}</span>
      </h2>

      <div :if={@aside != []} class="pb-1">{render_slot(@aside)}</div>
    </div>
    """
  end

  @doc """
  A small-caps mono link with a drawn-on underline. Accepts either
  `navigate` (live navigation) or `href`/`target` (external).
  """
  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(href navigate target rel download)

  slot :inner_block, required: true

  def ed_link(assigns) do
    ~H"""
    <.link
      class={[
        "ed-link inline-flex items-center gap-1 font-mono text-[11px] uppercase tracking-[0.18em]",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </.link>
    """
  end

  attr :project, :map, required: true
  attr :index, :string, default: nil

  def project_card(assigns) do
    ~H"""
    <article class="ed-card group flex flex-col border border-base-content/25 bg-base-100 p-6">
      <div class="mb-4 flex items-center justify-between font-mono text-xs text-base-content/45">
        <span class="tracking-[0.18em]">{@index}</span>
        <span
          :if={@project.url}
          class="inline-flex items-center gap-1.5 text-[10px] uppercase tracking-[0.18em] text-base-content/55"
        >
          <span class="size-1.5 rounded-full bg-success"></span> Live
        </span>
      </div>

      <h3 class="mb-3 font-display text-2xl font-semibold tracking-tight transition-colors group-hover:text-primary">
        {@project.name}
      </h3>

      <p class="mb-6 text-[15px] leading-relaxed text-base-content/75">{@project.description}</p>

      <div class="mt-auto flex flex-wrap gap-x-5 gap-y-2 border-t border-dotted border-base-content/30 pt-4">
        <.ed_link :if={@project.url} href={@project.url} target="_blank" class="text-primary">
          Demo <.icon name="hero-arrow-up-right-micro" class="size-3" />
        </.ed_link>
        <.ed_link href={@project.github} target="_blank">
          Source <.icon name="hero-arrow-up-right-micro" class="size-3" />
        </.ed_link>
        <.ed_link :if={@project.blog} href={@project.blog} target="_blank">
          Blog post <.icon name="hero-arrow-up-right-micro" class="size-3" />
        </.ed_link>
      </div>
    </article>
    """
  end

  attr :oss, :map, required: true
  attr :index, :string, default: nil

  def oss_card(assigns) do
    ~H"""
    <article class="ed-card group flex flex-col border border-base-content/25 bg-base-100 p-6">
      <div class="mb-4 flex items-center justify-between font-mono text-xs text-base-content/45">
        <span class="tracking-[0.18em]">{@index}</span>
        <span class="inline-flex items-center gap-1" title="GitHub stars">
          <.icon name="hero-star-micro" class="size-3" /> {@oss.stars}
        </span>
      </div>

      <h3 class="mb-3 font-display text-2xl font-semibold tracking-tight transition-colors group-hover:text-primary">
        {@oss.name}
      </h3>

      <p class="mb-6 text-[15px] leading-relaxed text-base-content/75">{@oss.description}</p>

      <div class="mt-auto flex flex-wrap gap-x-5 gap-y-2 border-t border-dotted border-base-content/30 pt-4">
        <.ed_link href={@oss.hex} target="_blank" class="text-primary">
          Hex.pm <.icon name="hero-arrow-up-right-micro" class="size-3" />
        </.ed_link>
        <.ed_link href={@oss.github} target="_blank">
          Source <.icon name="hero-arrow-up-right-micro" class="size-3" />
        </.ed_link>
        <.ed_link :if={@oss.blog} href={@oss.blog} target="_blank">
          Blog post <.icon name="hero-arrow-up-right-micro" class="size-3" />
        </.ed_link>
      </div>
    </article>
    """
  end

  attr :post, :map, required: true
  attr :index, :string, default: nil

  def post_card(assigns) do
    ~H"""
    <a href={@post.url} target="_blank" class="group flex items-baseline gap-3 py-3">
      <span
        :if={@index}
        class="w-6 shrink-0 font-mono text-xs tabular-nums text-base-content/45"
      >
        {@index}
      </span>

      <span class="font-display text-lg leading-snug transition-colors duration-200 group-hover:text-primary sm:text-xl">
        {@post.title}
      </span>

      <span class="min-w-8 flex-1 -translate-y-[0.2em] border-b border-dotted border-base-content/30 transition-colors duration-200 group-hover:border-base-content/60">
      </span>

      <span class="shrink-0 font-mono text-[11px] uppercase tracking-wider text-base-content/50">
        {@post.date}
      </span>
    </a>
    """
  end
end
