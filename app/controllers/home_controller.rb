class HomeController < ApplicationController
  def index
    require 'twitter'
    
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "LOz6dY18H8fMt3Wcg5wOz7zXi"
      config.consumer_secret = "VPfMZRTkMpgN40es0gABhbP0LTgDXawefgPGeXvAgjAOoemyVf"
      config.access_token = "598278212-Apdi4KQBlRItthxO9M16vE89LkwL9ER29151BoPI"
      config.access_token_secret = "V631yVg0MU22OkKHvCcOyxH0EARToSmACqMlGXJwdN5RI"
    end
    
    if @client.update(rand(1..10000))
      flash[:notice] = "successed"
    else
      flash[:error] = "error"
    end
  end
end
