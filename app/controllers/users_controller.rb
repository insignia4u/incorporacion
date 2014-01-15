class UsersController < ApplicationController
  before_filter :authenticate_user!

  expose(:users) { current_company.users.non_admin }

  def index; end

end
