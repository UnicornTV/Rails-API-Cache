require 'aws-sdk'
require 'open-uri'

open("stream-test.json", "wb") do |file|
  open("https://rails-api-cache.herokuapp.com/stream") do |uri|
    file.write(uri.read)
  end
end

s3 = Aws::S3::Resource.new(
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
  region: 'us-west-1'
)
bucket = s3.bucket(ENV['S3_BUCKET'])

# Make all files public
# bucket.objects.each { |o| o.acl.put({ acl: 'public-read' }) }

# Upload latest version of the stream
bucket.object('stream.json').upload_file('./stream.json', content_type: 'application/json', acl: 'public-read' )
