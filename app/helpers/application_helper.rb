module ApplicationHelper
  def full_title(title = '')
    default_title = "探求学園Rails専攻"
    title.blank? ? default_title : "#{title} | #{default_title}"
  end
end
