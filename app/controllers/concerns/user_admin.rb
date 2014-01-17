module UserAdmin
  def authorized_admin
    return true if current_user.admin?
    flash[:warning] = 'Unhautorized Access'
    redirect_to root_path
  end
end
