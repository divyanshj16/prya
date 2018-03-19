class FoundershipController < ApplicationController
  before_action :find_founder, only: [:destroy]
  before_action :authenticate_user!

  def create
    @startup = Startup.find(params[:startup_id])
    puts "****************************************"
    puts(@startup)
    puts "****************************************"
    puts params
    puts "****************************************"
    @startup.foundership.create(user_id: current_user.id)
    redirect_back fallback_location: root_path
  end

  def destroy
    @founder.destroy
    redirect_back fallback_location: root_path
    flash[:notice]  = "Founder removed Successfully"
  end

  private

  def find_founder
    @founder = Foundership.find(params[:id])
  end

end
