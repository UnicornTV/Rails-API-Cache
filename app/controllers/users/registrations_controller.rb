#
# Devise User Registration
#
# Override and Extend the default to allow custom params
#
class Users::RegistrationsController < Devise::RegistrationsController
  def resource_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :current_password
    )
  end

  private :resource_params
end
