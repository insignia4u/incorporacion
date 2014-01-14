module ApplicationHelper
  def get_active_class(string)
    'active' if string == controller_name
  end
end
