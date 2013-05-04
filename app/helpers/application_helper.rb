module ApplicationHelper
  def legend_view
    action_name + " " +  controller_name
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
  
end
