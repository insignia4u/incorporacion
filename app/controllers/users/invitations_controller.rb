class Users::InvitationsController < Devise::InvitationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def invite_resource
      params = invite_params.merge!({company_id: current_inviter.company_id})
      resource_class.invite!(params, current_inviter)
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:invite).concat [:full_name]
    end
end
