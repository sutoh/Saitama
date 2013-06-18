# -*- encoding: UTF-8 -*-

module ApplicationHelper
  def legend_view
    if controller.kind_of?(Admin::Base)
      action_name + " " +  controller_name.split("::")[1]
    else
      action_name + " " +  controller_name
    end
  end
  
  def action_name
    controller.action_name 
  end
  
  def controller_name
    params[:controller].classify
  end
  
  module_function
  
  
  def role_judge(role)
    Role_list[role]
  end
  
  def admin?
    current_user.role_id==ADMIN
  end
  
  
  
end
