class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |params|
      params.permit(
        :full_name, :email, :password, :password_confirmation,
        :company_attributes => (:name)
      )
    end
  end
end
