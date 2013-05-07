# coding: utf-8
class ApplicationController < ActionController::Base
	before_filter :authenticate_user!
  protect_from_forgery
  
  #権限管理用定数
  ADMIN = 1
  $genders_list = [['男性', 0],['女性', 1]]
  $tech_list = [['技術者', 1], ['営業', 2]]
  $staff_list = [['正社員', 1], ['契約社員', 2], ['個人事業主', 3], ['関連会社', 4]]
  
  private
  
  def after_sign_in_path_for(resource_or_scope)
    profile_index_path
  end
  
  def after_sign_out_path_for(resource_or_scope)
    user_session_path
  end
  
  
end
