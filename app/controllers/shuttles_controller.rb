class ShuttlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :select]
  
  def index
    @shuttles = Shuttle.all
  end

  def select
    @shuttle = Shuttle.find(params[:shuttle_id])
    unless @shuttle.is_full?
      current_user.shuttle = @shuttle
      current_user.save
      flash[:success] = "Thank you for choosing a shuttle! You should receive a confirmation email shortly."
    else
      flash[:error] = "This shuttle is full. Please choose a different shuttle."
    end
    redirect_to shuttles_path
  end

end
