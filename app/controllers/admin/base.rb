class Admin::Base < ApplicationController
  before_filter :admin_login_required
  
  private
  def admin_login_required
    raise Forbidden unless current_user.role_id == ADMIN
  end
end