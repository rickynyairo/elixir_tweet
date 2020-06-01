defmodule PluralsightTweet.Tweet do
  def search(str) do
    ExTwitter.configure(:process,
      consumer_key: System.get_env("TWITTER_CONSUMER_API_KEY"),
      consumer_secret: System.get_env("TWITTER_CONSUMER_API_SECRET"),
      access_token: System.get_env("TWITTER_ACCESS_TOKEN"),
      access_token_secret: System.get_env("TWITTER_ACCESS_TOKEN_SECRET")
    )

    ExTwitter.search(str, count: 10)
    |> Enum.map(fn tweet -> tweet.text end)
    |> Enum.join("\n-----\n")
    |> IO.puts()
  end
end
