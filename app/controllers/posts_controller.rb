#
# Posts
#
class PostsController < ApplicationController
  include Manageable

  private

  def filter_time(attributes, name)
     attrs = attributes.collect do |key, value|
       if key =~ /^#{Regexp.escape(name.to_s)}\((\d+)(\w)\)$/
         [$1.to_i, value.send("to_#$2")]
       end
     end.compact.sort_by(&:first).map(&:last)
     attributes.reject! {|key,value| key =~ /^#{Regexp.escape(name.to_s)}\((\d+)(\w)\)$/ }
     attributes[name] = Time.zone.local(*attrs) unless attrs.empty?
  end

  def allowed_params
    custom_params = []
    params.require(:post).permit(publishable_params | custom_params)
  end
end
