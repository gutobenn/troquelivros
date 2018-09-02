class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :addr_street, :addr_number, :addr_complement, :addr_city, :addr_state, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :addr_street, :addr_number, :addr_complement, :addr_city, :addr_state, :phone])
  end

end
