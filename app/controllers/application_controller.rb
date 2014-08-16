class ApplicationController < ActionController::Base

  # Public Activity
  include PublicActivity::StoreController

  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

   def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << []
    devise_parameter_sanitizer.for(:account_update) << []
  end 

end
