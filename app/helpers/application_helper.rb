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
    Genders_list.select{|s| s[1] == gender}[0][0].presence || "Unkown"
  end
  
  def role_judge(role)
    Role_list[role]
  end
  
  def fullname(family,given)
    "#{(family.presence || "")} #{(given.presence || "")}"
  end
  
  def nenrei(birthday)
    day = Date.today
    # 取り敢えず版うるう年考慮無し
    # TODO
    (day-birthday).to_i/365
  end
  
  
end
