#
# Post Serializer
#
# "type" : "foo",
# "timestamp" : "11:05am",
# "description" : "We are all connected, co-dependent, and tied together for better and for worse.",
# "photo": "",
#
class PostSerializer < ActiveModel::Serializer
  attributes :id, :type, :timestamp, :published_date, :share_text, :description, :photo

  def id
    "id-#{object.id.to_s}"
  end

  def timestamp
    object.published_date.strftime('%l:%M%P')
  end
end