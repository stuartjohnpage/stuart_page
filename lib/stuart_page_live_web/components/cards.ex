defmodule StuartPageLiveWeb.Cards do
  @moduledoc """
  Reusable card components for projects, open source, and blog posts.
  """
  use Phoenix.Component

  import StuartPageLiveWeb.CoreComponents, only: [icon: 1]

  attr :project, :map, required: true

  def project_card(assigns) do
    ~H"""
    <div class="card bg-base-200 card-glow">
      <div class="card-body">
        <h3 class="card-title">{@project.name}</h3>
        <p class="text-base-content/70 leading-relaxed">{@project.description}</p>
        <div class="card-actions justify-end mt-6 pt-4 border-t border-base-300">
          <a :if={@project.blog} href={@project.blog} target="_blank" class="btn btn-ghost btn-sm">
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

  attr :oss, :map, required: true

  def oss_card(assigns) do
    ~H"""
    <div class="card bg-base-200 card-glow">
      <div class="card-body">
        <div class="flex items-center gap-3">
          <h3 class="card-title">{@oss.name}</h3>
          <div class="badge badge-primary badge-sm gap-1">
            <svg viewBox="0 0 16 16" class="size-3 fill-current" aria-hidden="true">
              <path d="M8 .25a.75.75 0 0 1 .673.418l1.882 3.815 4.21.612a.75.75 0 0 1 .416 1.279l-3.046 2.97.719 4.192a.75.75 0 0 1-1.088.791L8 12.347l-3.766 1.98a.75.75 0 0 1-1.088-.79l.72-4.194L.818 6.374a.75.75 0 0 1 .416-1.28l4.21-.611L7.327.668A.75.75 0 0 1 8 .25Z" />
            </svg>
            {@oss.stars}
          </div>
        </div>
        <p class="text-base-content/70 leading-relaxed">{@oss.description}</p>
        <div class="card-actions justify-end mt-6 pt-4 border-t border-base-300">
          <a :if={@oss.blog} href={@oss.blog} target="_blank" class="btn btn-ghost btn-sm">
            Blog Post
          </a>
          <a href={@oss.hex} target="_blank" class="btn btn-ghost btn-sm">
            Hex.pm
          </a>
          <a href={@oss.github} target="_blank" class="btn btn-ghost btn-sm">
            Source
          </a>
        </div>
      </div>
    </div>
    """
  end

  attr :post, :map, required: true

  def post_card(assigns) do
    ~H"""
    <a
      href={@post.url}
      target="_blank"
      class="group card bg-base-200 card-glow"
    >
      <div class="card-body flex-row justify-between items-center py-5 gap-4">
        <h3 class="font-medium group-hover:text-primary transition-colors">{@post.title}</h3>
        <span class="text-base-content/40 text-sm whitespace-nowrap">{@post.date}</span>
      </div>
    </a>
    """
  end
end
