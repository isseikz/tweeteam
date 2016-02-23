class GetTweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  def collect_tweet
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "LOz6dY18H8fMt3Wcg5wOz7zXi"
      config.consumer_secret = "VPfMZRTkMpgN40es0gABhbP0LTgDXawefgPGeXvAgjAOoemyVf"
      config.access_token = "598278212-Apdi4KQBlRItthxO9M16vE89LkwL9ER29151BoPI"
      config.access_token_secret = "V631yVg0MU22OkKHvCcOyxH0EARToSmACqMlGXJwdN5RI"
    end
    
    user_name = "mackyrollis"
    @client.user_timeline(user_name).each do |tweet|
      if tweet.text.include?("#test") && !Tweet.where(tweet_id: tweet.id).any?
        @tweet = Tweet.new
        @tweet.user_id = user_name
        @tweet.tweet_id = tweet.id
        @tweet.content = tweet.text
        @tweet.date = tweet.created_at.strftime('%a %b %d %H:%M:%S %Z %Y')
        @tweet.save
      end
    end
  end
end
