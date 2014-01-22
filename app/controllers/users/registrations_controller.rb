class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def new
    super
  end

  def create
    build_resource(sign_up_params)
    resource.admin = true #Sets admin
    resource.skip_confirmation!
    if resource.save
      yield resource if block_given?
      set_flash_message :notice, :signed_up if is_flashing_format?
      sign_up(resource_name, resource)
      respond_with resource, :location => after_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |params|
      params.permit(
        :full_name, :email, :password, :password_confirmation,
        company_attributes: [:name]
      )
    end
  end
end
