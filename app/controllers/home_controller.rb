class HomeController < ApplicationController
  def index
  end

  def verifyInvestor
    @user = current_user
  end

  def feed
    #testing
    @posts = Post.all
  end
end
