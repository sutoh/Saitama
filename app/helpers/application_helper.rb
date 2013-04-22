module ApplicationHelper
  def legend_view
    action_name + " " +  controller_name
  end
  def action_name
    controller.action_name 
  end
  def controller_name
    params[:controller] 
  end
end
