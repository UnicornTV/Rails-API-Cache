module ApplicationHelper

  include Twitter::Autolink

  def nav_link(link_text, link_path, options = {})
    class_name = current_page?(link_path) ? ' active item' : 'item'

    options[:class] ||= ''
    options[:class] += class_name

    text = ''
    text += link_text

    link_to text.html_safe, link_path, options
  end

end