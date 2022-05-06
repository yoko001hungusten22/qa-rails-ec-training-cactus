module ApplicationHelper
  def full_title(title = '')
    default_title = "Myapp"
    title.blank? ? default_title : "#{title} | #{default_title}"
  end
end
