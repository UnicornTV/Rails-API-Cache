#
# Post Decorator
#
class PostDecorator < Draper::Decorator
  delegate_all

  def share_text
    h.auto_link(object.share_text).html_safe
  end

  def description
    h.auto_link(object.description).html_safe
  end
end
