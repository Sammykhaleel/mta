class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :authenticate_user!

  
# private

#   def require_login
#     unless logged_in?
#       flash[:error] = "You must be logged in to access this section"
#       redirect_to root_url # halts request cycle
#     end
#   end

#   def logged_in?
#     !!current_user
#   end


  protected
    def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |params|
    params.permit(
      :email, :password, :password_confirmation, :name, :phone_number
    )
  }
  devise_parameter_sanitizer.for(:account_update) { |params|
    params.permit(
      :email, :password, :password_confirmation, :name,
      :phone_number
    )
  }
end
end
