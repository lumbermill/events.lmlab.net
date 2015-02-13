module ApplicationHelper
  def isEventPage?()
    controller_name == "events" && action_name == "show"
  end
end
