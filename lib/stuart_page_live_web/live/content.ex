defmodule StuartPageLiveWeb.Content do
  @moduledoc """
  Static content for the site — projects, open source, and blog posts.
  """

  def projects do
    [
      %{
        name: "Elixir Hero",
        description:
          "A real-time guitar toolkit with a tuner, amp effects chain with oscilloscope, and a rhythm game — all powered by Rust/WASM audio processing and Phoenix LiveView.",
        url: "https://elixir-hero.fly.dev/",
        github: "https://github.com/stuartjohnpage/elixir_hero"
      },
      %{
        name: "Flappy Phoenix",
        description:
          "A Flappy Bird clone built entirely in Phoenix LiveView with power-ups, increasing difficulty, and a scoring system.",
        url: "https://flappyphoenix.fly.dev/",
        github: "https://github.com/stuartjohnpage/flappyphoenix",
        blog: "https://revelry.co/insights/development/elixir/build-flappybird-using-liveview/"
      },
      %{
        name: "Unwrapped",
        description:
          "A gift-tracking app for large families that prevents duplicate gifts while keeping each person's presents a surprise. Currently in development.",
        url: nil,
        github: "https://github.com/stuartjohnpage/unwrapped"
      }
    ]
  end

  def featured_projects, do: projects()

  def open_source do
    [
      %{
        name: "TextChunker",
        description:
          "An Elixir library for segmenting large text documents, optimizing them for embedding and storage within vector databases for RAG applications. Inspired by LangChain's text splitters.",
        github: "https://github.com/revelrylabs/text_chunker_ex",
        hex: "https://hex.pm/packages/text_chunker",
        stars: 108,
        blog: "https://revelry.co/insights/artificial-intelligence/announcing-textchunker/"
      },
      %{
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

  def posts do
    [
      %{
        title: "DeltaQuery: Simple Delta Sharing for Elixir",
        url: "https://revelry.co/insights/elixir-delta-sharing-with-delta-query/",
        date: "February 2026"
      },
      %{
        title: "How and When to Use NimbleParsec",
        url: "https://revelry.co/insights/development/elixir/nimbleparsec/",
        date: "November 2025"
      },
      %{
        title: "Which Language is Best for AI Code Generation?",
        url: "https://revelry.co/insights/artificial-intelligence/which-language-is-best-for-ai-code-generation/",
        date: "October 2025"
      },
      %{
        title: "Why Your AI Code Bias is Making You a Worse Reviewer",
        url: "https://revelry.co/insights/artificial-intelligence/your-ai-code-bias-makes-you-a-worse-reviewer/",
        date: "September 2025"
      },
      %{
        title: "How to Maintain Your Joy as a Developer in the Age of AI",
        url: "https://revelry.co/insights/artificial-intelligence/joy-developing-with-ai/",
        date: "2025"
      },
      %{
        title: "How to Use Hermes MCP to Boost Your AI Chat App",
        url: "https://revelry.co/insights/integrating-hermes-mcp-into-phoenix/",
        date: "2025"
      },
      %{
        title: "How to Run Your Own Private LLM Server and Keep Your Old Windows Gaming Laptop Relevant",
        url: "https://revelry.co/insights/how-to-run-a-private-llm-server-on-a-laptop/",
        date: "2025"
      },
      %{
        title: "Build a Game in Phoenix LiveView Without JavaScript",
        url: "https://revelry.co/insights/development/elixir/build-flappybird-using-liveview/",
        date: "2024"
      },
      %{
        title: "Announcing TextChunker: Flexible Semantic Text Chunking for Elixir",
        url: "https://revelry.co/insights/artificial-intelligence/announcing-textchunker/",
        date: "2024"
      },
      %{
        title: "Understanding and Using Reinforcement Learning",
        url: "https://revelry.co/insights/demystifying-reinforcement-learning/",
        date: "2024"
      },
      %{
        title: "Lessons Learned from the Hackers Hall of Infamy",
        url: "https://revelry.co/insights/development/lessons-learned-from-hackers/",
        date: "2024"
      },
      %{
        title: "Stop Camouflaging Your Software Bugs",
        url: "https://revelry.co/insights/processes/camouflaged-software-bugs/",
        date: "2024"
      },
      %{
        title: "The Bitcoin Extended Public Key: Explaining the Mystery",
        url: "https://revelry.co/insights/blockchain/bitcoin-extended-public-key/",
        date: "2023"
      },
      %{
        title: "Your Brain != A Computer",
        url: "https://revelry.co/off-the-beaten-path/brains-computers/",
        date: "2023"
      }
    ]
  end

  def featured_posts, do: Enum.take(posts(), 4)
end
