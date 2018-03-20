class HomeController < ApplicationController
  def index
  end
  def feed
    #testing
    @posts = Post.all
    @startups = current_user_startups
  end
  def current_user_startups
  	Startup.find(current_user.founderships.pluck(:id))
  end
end
