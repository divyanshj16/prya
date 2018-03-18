class TagsController < ApplicationController
  def tokens
    render json: {:tags => Tag.find_keyword(params[:q]) }
  end
end
