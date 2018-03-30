class StartupsController < ApplicationController
  before_action :find_startup, only: [:show, :edit, :update, :add_tag, :delete_tag, :publishThis]
  skip_before_action :verify_authenticity_token, only: [:add_tag, :delete_tag ]

  def index
    #listing
  end

  def show
    # for trial
    @post= Post.first
    #new post
    @post_new = Post.new
  end

  def new
    @startup = Startup.new
  end

  def create
    @startup = Startup.new(startup_params)
    if @startup.save
      Foundership.create(startup_id: @startup.id, user_id: current_user.id)
      redirect_to startup_path(@startup), notice: 'Successfully created!'
    else
      redirect_back fallback_location: root_path, alert: @startup.errors.messages
    end
  end

  def edit
    #code
  end

  def update
    if @startup.update_attributes(startup_params)
      redirect_to startup_path(@startup), notice: 'Details successfully updated!'
    else
      redirect_back fallback_location: root_path, alert: @startup.errors.messages
    end
  end

  def add_tag
    tags = tag_params.split(',')
    tags.each do |word|
      @startup.add_tag! word, current_user
    end

    redirect_to startup_path(@startup), notice: "Tags added successfully : #{tags.join(', ')}"
  end

  def delete_tag
    tags = tag_params.split(',')
    tags.each do |word|
      @startup.remove_tag! word, current_user
    end

    redirect_to startup_path(@startup), notice: "Tag removed successfully : #{tags.join(', ')}"
    #code
  end

  def publishThis
    p_id = params[:p_id]
    @startup.presentations.each do |ppts|
      ppts.publish = false
      ppts.save
    end
    this_ppt = Presentation.find(p_id)
    this_ppt.publish= true
    this_ppt.save
  end

  private

  def tag_params
      params.require(:tag)
    end

  def find_startup
    @startup = Startup.find(params[:id]) if params[:id].present?
  end

  def startup_params
    params.require(:startup).permit(:title, :about, :description, :sustage_id)
  end

end
