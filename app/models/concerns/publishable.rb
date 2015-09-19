#
# Anything that can be published with a permalink
# allowing sharing and SEO, etc
#
module Publishable
  extend ActiveSupport::Concern

  included do
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::MultiParameterAttributes

    field :published, type: Boolean # Whether or not this content be available
    field :published_date, type: DateTime # Localized timestamp for sorting
    field :type, type: String, default: 'twitter' # Select type for conditional styling
    field :author, type: String # Either fixed (foo / bar) or Twitter name
    field :description, type: String # Post text
    field :share_text, type: String # The text that should be used if the user decides to share the post
    field :photo, type: String # Media Attachment
    field :profile, type: String # Author Avatar
    field :handle, type: String # Essentially the @username

    scope :published, -> { where(published: true) }
    scope :sorted, -> { desc(:published_date) }

    validates :share_text, length: { maximum: 140 }
    validates :description, length: { minimum: 20, maximum: 140 }

    after_save 'self.class.update_aws_s3'

    def self.update_aws_s3
      bucket = Manticore::S3.bucket(ENV['S3_BUCKET'])

      open("https://rails-api-cache.herokuapp.com/stream") do |uri|
        bucket.object('stream.json').put(body: uri.read, content_type: 'application/json', acl: 'public-read' )
      end
    end
  end
end