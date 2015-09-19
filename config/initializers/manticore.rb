module Manticore
  Config = YAML.load(File.open "#{Rails.root}/config/config.yml")[Rails.env].to_hashugar

  S3 = Aws::S3::Resource.new(
    credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
    region: 'us-west-1'
  )
end