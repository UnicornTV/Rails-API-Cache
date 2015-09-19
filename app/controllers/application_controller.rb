#
# Main Application Controller
#
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :fully_registered?
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :reload_settings

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  private

  def fully_registered?
    if current_user && current_user.valid?
      true
    else
      flash[:warning] = t('registration.incomplete')
      false
    end
  end

  protected

  def reload_settings
    Settings.reload
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(
        :username,
        :email,
        :first_name,
        :last_name,
        roles: []
      )
    end
  end
end
