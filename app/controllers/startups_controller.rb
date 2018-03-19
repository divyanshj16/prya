class StartupsController < ApplicationController
  before_action :find_startup, only: [:show, :edit, :update, :join]

  def index
    #listing
  end

  def show
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

  private

  def find_startup
    @startup = Startup.find(params[:id]) if params[:id].present?
  end

  def startup_params
    params.require(:startup).permit(:title, :about, :description, :sustage_id)
  end

end
