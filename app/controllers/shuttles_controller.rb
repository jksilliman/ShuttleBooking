class ShuttlesController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :select]
  
  def index
    @shuttles = Shuttle.all
    current_user.on_shuttle_form = true
  end

  def select
    current_user.on_shuttle_form = true

    current_user.attributes = params[:user] 
    
    send_mail = current_user.shuttle_id_changed?

    if current_user.save
      if send_mail
        ConfirmationMailer.confirm_shuttle(current_user, current_user.shuttle).deliver

        flash[:success] = "Thank you for choosing a shuttle! You should receive a confirmation email shortly."
      else
        flash[:success] = "Thank you for changing your contact information."
      end
      redirect_to shuttles_path
    else
      @shuttles = Shuttle.all
      render :index
    end
  end

end
