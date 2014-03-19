class Users::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    if session[:url_back]
      temp = session[:url_back]
      session[:url_back] = nil
      return temp
    else
      return super(resource)
    end
  end
  def create
    print "TEST!"
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    print "TEST2"
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    print "TEST3"
    sign_in(resource_name, resource)
    print "TEST4"
    respond_with resource, :location => redirect_location(resource_name, resource)
  end
end
