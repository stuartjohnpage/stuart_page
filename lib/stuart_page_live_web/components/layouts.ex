defmodule StuartPageLiveWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use StuartPageLiveWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
  Renders your app layout.

  This function is typically invoked from every template,
  and it often contains your application menu, sidebar,
  or similar.

  ## Examples

      <Layouts.app flash={@flash}>
        <h1>Content</h1>
      </Layouts.app>

  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <header class="sticky top-0 z-50 border-t-4 border-t-base-content bg-base-100/85 backdrop-blur-sm">
      <div class="mx-auto max-w-5xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-14 items-center justify-between">
          <a
            href="/"
            class="font-display text-xl font-semibold tracking-tight transition-colors hover:text-primary"
          >
            Stuart Page
          </a>
          <%!-- Desktop nav --%>
          <nav class="hidden items-center gap-7 md:flex">
            <.link
              navigate={~p"/projects"}
              class="ed-link font-mono text-[11px] uppercase tracking-[0.18em]"
            >
              Projects
            </.link>
            <.link
              navigate={~p"/writing"}
              class="ed-link font-mono text-[11px] uppercase tracking-[0.18em]"
            >
              Writing
            </.link>
            <.theme_toggle />
          </nav>
          <%!-- Mobile nav --%>
          <div class="flex items-center gap-3 md:hidden">
            <.theme_toggle />
            <div class="dropdown dropdown-end">
              <div
                tabindex="0"
                role="button"
                class="cursor-pointer p-2 transition-colors hover:text-primary"
                aria-label="Menu"
              >
                <.icon name="hero-bars-3" class="size-5" />
              </div>

              <ul
                tabindex="0"
                class="dropdown-content menu z-10 mt-3 w-44 border border-base-content/20 bg-base-100 p-2 font-mono text-xs uppercase tracking-[0.15em] shadow-lg"
              >
                <li><.link navigate={~p"/projects"}>Projects</.link></li>

                <li><.link navigate={~p"/writing"}>Writing</.link></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="masthead-rule"></div>
    </header>

    <main class="px-4 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-5xl">{@inner_content}</div>
    </main>

    <footer class="mt-16 px-4 sm:px-6 lg:px-8">
      <div class="mx-auto max-w-5xl">
        <div class="masthead-rule"></div>
        <div class="flex flex-col items-center gap-5 py-10 text-center">
          <p class="font-display text-lg italic text-base-content/80">
            Thanks for reading.
          </p>

          <p class="font-display text-sm tracking-[0.5em] text-base-content/50" aria-hidden="true">
            * * *
          </p>

          <nav class="flex flex-wrap justify-center gap-x-6 gap-y-2">
            <.ed_link href="https://github.com/stuartjohnpage" target="_blank">
              GitHub <.icon name="hero-arrow-up-right-micro" class="size-3" />
            </.ed_link>
            <.ed_link href="https://www.linkedin.com/in/stuartjohnpage" target="_blank">
              LinkedIn <.icon name="hero-arrow-up-right-micro" class="size-3" />
            </.ed_link>
            <.ed_link href="mailto:stuartjohnpage@live.com">
              Email <.icon name="hero-envelope-micro" class="size-3" />
            </.ed_link>
          </nav>

          <p class="font-mono text-[10px] uppercase leading-relaxed tracking-[0.18em] text-base-content/45">
            Set in Fraunces, Newsreader &amp; Spline Sans Mono · Built with
            <a href="https://phoenixframework.org" target="_blank" class="hover:text-primary">
              Phoenix
            </a>
            &amp;
            <a href="https://elixir-lang.org" target="_blank" class="hover:text-primary">Elixir</a>
            · © {Date.utc_today().year} Stuart Page
          </p>
        </div>
      </div>
    </footer>
    <.flash_group flash={@flash} />
    """
  end

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} /> <.flash kind={:error} flash={@flash} />
      <.flash
        id="client-error"
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={show(".phx-server-error #server-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#server-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end

  @doc """
  Provides dark vs light theme toggle based on themes defined in app.css.

  See <head> in root.html.heex which applies the theme before page load.
  """
  def theme_toggle(assigns) do
    ~H"""
    <div class="relative flex flex-row items-center rounded-sm border border-base-content/25 bg-base-200">
      <div class="absolute h-full w-1/3 rounded-[3px] border border-base-content/30 bg-base-100 left-0 [[data-theme=light]_&]:left-1/3 [[data-theme=dark]_&]:left-2/3 transition-[left] duration-200" />
      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="system"
      >
        <.icon name="hero-computer-desktop-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>
      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="light"
      >
        <.icon name="hero-sun-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>
      <button
        class="flex p-2 cursor-pointer w-1/3"
        phx-click={JS.dispatch("phx:set-theme")}
        data-phx-theme="dark"
      >
        <.icon name="hero-moon-micro" class="size-4 opacity-75 hover:opacity-100" />
      </button>
    </div>
    """
  end
end
