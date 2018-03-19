class HomeController < ApplicationController
  def index
  end
  def feed
    #testing
    @post = Post.first
  end
end
