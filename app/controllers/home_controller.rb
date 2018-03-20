class HomeController < ApplicationController
  def index
  end
  def feed
    #testing
    @posts = Post.all
  end
end
