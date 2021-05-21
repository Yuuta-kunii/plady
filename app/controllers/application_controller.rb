class ApplicationController < ActionController::Base
  
  add_flash_types :success,:danger,:info,:warning
  
  def current_user
    @current_user||=User.find_by(id: session[:user_id])
  end
  
  def loggedin?
    !current_user.nil?
  end
end
