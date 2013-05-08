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
  
  def gender_judge(gender)
    _gender_name = Genders_list.select{|s| s[1] == gender}
    _gender_name.empty? ? "Unknown" : _gender_name[0][0]
  end
  
  def role_judge(role)
    roles = Role_list
    role_name = roles[role]
  end
  
  def fullname(family,given)
    _f = family.nil? ? "" : family
    _g = given.nil? ? "" : given
    _f + " " + given
  end
  
  def nenrei(birthday)
    day = Date.today
    # 取り敢えず版うるう年考慮無し
    # TODO
    (day-birthday).to_i/365
  end
  
  
end
