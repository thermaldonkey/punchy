class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      # Include any attributes once made "accessible" in the model layer, necessary for creating a user account
      u.permit(:initials, :department, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      # Include any attributes once made "accessible" in the model layer, necessary for updating a user account
      u.permit(:initials, :department, :email, :password, :password_confirmation, :current_password)
    end
  end
end
