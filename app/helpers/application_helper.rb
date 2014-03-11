module ApplicationHelper
  def app_name
    "Fun Trucker"
  end

  def title
    @title ||= app_name + (content_for?(:title) ? " | " + content_for(:title) : "")
  end

  def active_if(name)
    controller_name == name ? 'active' : ''
  end
end

