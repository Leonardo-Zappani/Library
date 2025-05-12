# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # uncomment to allow extra User model params during registration (beyond email/password)
  # before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(_resource)
    root_path
  end

  # whitelist extra User model params by uncommenting below and adding User attrs as keys
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  # end
end
