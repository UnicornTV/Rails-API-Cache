#
# Video Decorator
#
class VideoDecorator < Draper::Decorator
  delegate_all

  def description
    h.auto_link(object.description).html_safe
  end
end
