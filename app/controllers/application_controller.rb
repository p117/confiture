class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  #ajouter au controlleur de la route que l'on veut protéger
  protected
  def check_access
    redirect_to new_user_session_path and return unless user_signed_in? 
  end
  # private
  # def record_not_found
  #     render plain: "404 Not Found", status: 404
  # end
end
