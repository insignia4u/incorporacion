class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protected
    def current_company
      return nil unless current_user
      @current_company ||= current_user.company
    end
    
    helper_method :current_company
end
