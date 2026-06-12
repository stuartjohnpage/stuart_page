# Fetches the Revelry author RSS feed and prepends any new articles to
# priv/posts.json. Run from the project root:
#
#     elixir scripts/update_posts.exs
#
# Exits normally with no file changes when there is nothing new, so CI can
# rely on `git diff` to decide whether to open a pull request.
#
# Note: feed titles arrive sentence-case; this site uses title case, so new
# entries should be reviewed (and usually re-cased) before merging.

Mix.install([{:req, "~> 0.5"}, {:jason, "~> 1.4"}])

defmodule Feed do
  @months %{
    "Jan" => "January",
    "Feb" => "February",
    "Mar" => "March",
    "Apr" => "April",
    "May" => "May",
    "Jun" => "June",
    "Jul" => "July",
    "Aug" => "August",
    "Sep" => "September",
    "Oct" => "October",
    "Nov" => "November",
    "Dec" => "December"
  }

  def items(xml) do
    case Regex.scan(~r/<item>(.*?)<\/item>/s, xml) do
      [] ->
        raise "No <item> elements found in feed — has the feed format changed?"

      matches ->
        Enum.map(matches, fn [_, item] ->
          %{
            "date" => item |> tag("pubDate") |> format_date(),
            "title" => item |> tag("title") |> decode_entities(),
            "url" => tag(item, "link")
          }
        end)
    end
  end

  defp tag(item_xml, name) do
    case Regex.run(~r/<#{name}>(.*?)<\/#{name}>/s, item_xml) do
      [_, content] -> content |> String.trim() |> strip_cdata()
      nil -> raise "Missing <#{name}> in feed item"
    end
  end

  defp strip_cdata("<![CDATA[" <> rest), do: String.trim_trailing(rest, "]]>")
  defp strip_cdata(text), do: text

  defp decode_entities(text) do
    text
    |> String.replace(~r/&#x([0-9a-fA-F]+);/, fn match ->
      [_, hex] = Regex.run(~r/&#x([0-9a-fA-F]+);/, match)
      <<String.to_integer(hex, 16)::utf8>>
    end)
    |> String.replace(~r/&#(\d+);/, fn match ->
      [_, dec] = Regex.run(~r/&#(\d+);/, match)
      <<String.to_integer(dec)::utf8>>
    end)
    |> String.replace("&lt;", "<")
    |> String.replace("&gt;", ">")
    |> String.replace("&quot;", "\"")
    |> String.replace("&apos;", "'")
    |> String.replace("&amp;", "&")
  end

  # "Thu, 11 Jun 2026 15:42:01 +0000" -> "June 2026"
  defp format_date(pub_date) do
    case String.split(pub_date) do
      [_dow, _day, month, year | _] when is_map_key(@months, month) ->
        "#{@months[month]} #{year}"

      _ ->
        raise "Unrecognized pubDate format: #{inspect(pub_date)}"
    end
  end
end

feed_url = "https://revelry.co/author/stuart-page/feed/"
posts_path = Path.expand("../priv/posts.json", __DIR__)

response = Req.get!(feed_url, decode_body: false)

if response.status != 200 do
  raise "Feed request failed with HTTP #{response.status}"
end

feed_posts = Feed.items(response.body)

existing = posts_path |> File.read!() |> Jason.decode!()
normalize = &String.trim_trailing(&1, "/")
existing_urls = MapSet.new(existing, fn post -> normalize.(post["url"]) end)

new_posts =
  Enum.reject(feed_posts, fn post ->
    MapSet.member?(existing_urls, normalize.(post["url"]))
  end)

case new_posts do
  [] ->
    IO.puts("No new posts found (feed has #{length(feed_posts)} items, all known).")

  _ ->
    File.write!(posts_path, Jason.encode!(new_posts ++ existing, pretty: true) <> "\n")

    Enum.each(new_posts, fn post ->
      IO.puts("Added: #{post["title"]} (#{post["date"]}) — #{post["url"]}")
    end)
end
