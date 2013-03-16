class ApplicationController < ActionController::Base
	before_filter :authenticate_user!
  protect_from_forgery
  
  private
  
  def after_sign_in_path_for(resource_or_scope)
    profile_index_path
  end
  
end
