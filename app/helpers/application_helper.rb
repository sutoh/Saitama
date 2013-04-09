module ApplicationHelper
  def legend_view
    @action_name + " " +  @controller
  end
  def action_name
    controller.action_name.capitalize
  end
  def controller_name
    params[:controller].classify
  end
end
