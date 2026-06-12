defmodule StuartPageLive.Content do
  @moduledoc """
  Portfolio content — projects, open source contributions, and blog posts.

  All data is defined as structs with enforced keys, so missing fields
  cause compile-time errors rather than silent template failures.

  Blog posts live in `priv/posts.json` (newest first) and are loaded at
  compile time, so `scripts/update_posts.exs` can append new articles
  without touching code.
  """

  defmodule Project do
    @enforce_keys [:name, :description, :github]
    defstruct [:name, :description, :github, :url, :blog]
  end

  defmodule OpenSource do
    @enforce_keys [:name, :description, :github, :hex, :stars]
    defstruct [:name, :description, :github, :hex, :stars, :blog]
  end

  defmodule Post do
    @enforce_keys [:title, :url, :date]
    defstruct [:title, :url, :date]
  end

  def projects do
    [
      %Project{
        name: "Elixir Hero",
        description:
          "A real-time guitar toolkit with a tuner, amp effects chain with oscilloscope, and a rhythm game, all powered by Rust/WASM audio processing and Phoenix LiveView.",
        url: "https://elixir-hero.fly.dev/",
        github: "https://github.com/stuartjohnpage/elixir_hero"
      },
      %Project{
        name: "Flappy Phoenix",
        description:
          "A Flappy Bird inspired game built entirely in Phoenix LiveView with power-ups, increasing difficulty, and a scoring system.",
        url: "https://flappyphoenix.fly.dev/",
        github: "https://github.com/stuartjohnpage/flappyphoenix",
        blog: "https://revelry.co/insights/development/elixir/build-flappybird-using-liveview/"
      },
      %Project{
        name: "Unwrapped",
        description:
          "A gift-tracking app for large families that prevents duplicate gifts while keeping each person's presents a surprise. Currently in development.",
        github: "https://github.com/stuartjohnpage/unwrapped"
      }
    ]
  end

  def featured_projects, do: projects()

  def open_source do
    [
      %OpenSource{
        name: "TextChunker",
        description:
          "An Elixir library for segmenting large text documents, optimizing them for embedding and storage within vector databases for RAG applications. Inspired by LangChain's text splitters.",
        github: "https://github.com/revelrylabs/text_chunker_ex",
        hex: "https://hex.pm/packages/text_chunker",
        stars: 108,
        blog: "https://revelry.co/insights/artificial-intelligence/announcing-textchunker/"
      },
      %OpenSource{
        name: "DeltaQuery",
        description:
          "A high-level Elixir client for querying shared Delta tables across organizations. Supports filtering, joins, aggregations, and returns native Elixir data structures.",
        github: "https://github.com/revelrylabs/delta_query",
        hex: "https://hex.pm/packages/delta_query",
        stars: 13,
        blog: "https://revelry.co/insights/elixir-delta-sharing-with-delta-query/"
      }
    ]
  end

  @posts_path Path.expand("../../priv/posts.json", __DIR__)
  @external_resource @posts_path

  @posts Enum.map(
           Jason.decode!(File.read!(@posts_path)),
           fn %{"title" => title, "url" => url, "date" => date} ->
             struct!(Post, title: title, url: url, date: date)
           end
         )

  def posts, do: @posts

  def featured_posts, do: Enum.take(posts(), 4)
end
