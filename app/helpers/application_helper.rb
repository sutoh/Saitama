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
  
  def gender_judge(gender)
    _gender_name = $genders_list.select{|s| s[1] == gender}
    _gender_name.empty? ? "Unknown" : _gender_name[0][0]
  end
  
  def role_judge(role)
    roles = {0 => "一般ユーザ" , 1 => "管理者"}
    role_name = roles[role]
  end
  
end
