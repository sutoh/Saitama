class ApplicationController < ActionController::Base
	before_filter :authenticate_user!
  protect_from_forgery
  
  #権限管理用定数
  ADMIN = 1
  
  private
  
  def after_sign_in_path_for(resource_or_scope)
    profile_index_path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end
end
