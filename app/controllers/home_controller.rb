class HomeController < ApplicationController
  def index
  end
  def feed
    #testing
    @posts = Post.all
    @startups = current_user_startups
  end
end
