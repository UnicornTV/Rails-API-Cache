#
# Tweet
#
class Tweet
  include Publishable

  field :identifier, type: String
  field :url, type: String
end