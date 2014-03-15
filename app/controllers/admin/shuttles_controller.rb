class Admin::ShuttlesController < Admin::BaseController
  load_and_authorize_resource
  respond_to :html

  def index
    @shuttles = Shuttle.order("departure_time ASC")
    respond_with(@shuttles)
  end

  # TODO - List of cnetids for users on the bus
  def show
    respond_with(@shuttle)
  end

  def new
    respond_with(@shuttle)
  end

  def create
    @shuttle.save
    respond_with(@shuttle, :location => admin_shuttles_path)
  end

  def delete_user
    @shuttle.delete(@shuttle.users.find_by_id(params[:uid]))
    respond_with(@shuttle)
  end

  def destroy
    # TODO - Notify users that their bus changed
    @shuttle.destroy
    respond_with(@shuttle) 
  end

end
