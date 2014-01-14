class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protected
    def current_company
      return nil unless current_user
      @current_company ||= current_user.company
    end

    def authenticate_inviter!
      authenticate_user!(:force => true)
    end

    def layout_by_resource
      if devise_controller? && is_a?(Devise::SessionsController)
        "session"
      else
        "application"
      end
    end


    helper_method :current_company
end
