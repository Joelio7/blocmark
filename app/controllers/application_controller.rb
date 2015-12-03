class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << :username
  end

  def after_sign_in_path_for(users)
  current_user
  end
end
