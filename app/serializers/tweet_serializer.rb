#
# Tweet Serializer
#
# "type" : "foo",
# "author" : "Foo | ",
# "timestamp" : "11:05am",
# "description" : "We are all connected, co-dependent, and tied together for better and for worse.",
# "photo": "",
# "profile" : "",
# "handle" : ""
#
class TweetSerializer < ActiveModel::Serializer
  attributes :id, :type, :author, :timestamp, :published_date, :share_text, :description, :photo, :profile, :handle, :identifier, :url

  def id
    "id-#{object.id.to_s}"
  end

  def timestamp
    object.published_date.strftime('%l:%M%P')
  end
end