class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  protected

	  def current_user
      if session[:user_id]
  		  @current_user = User.find(session[:user_id]) || @current_user
      end
  	end

  	def require_user!
  		unless current_user
  			redirect_to register_path, flash: { success: "Please log in first." }
  		end
  	end
end
