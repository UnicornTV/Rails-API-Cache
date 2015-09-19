#
# Base API Controller
#
class ApiController < ActionController::Base
  respond_to :json

  # before_action :authorize_application

  # The actual public API stream
  def stream
    render json: { state: Settings.app_state, content: serialized_content }
  end

  # This is a little hack to store single-instance data in MongoDB
  def settings
    Settings.app_state = params['app_state']
    Settings.reload
    Post.update_aws_s3
  end

  private

  # A little hack to grab and serialize both Posts and Tweets
  # and collect them into an array sorted by most recent
  def serialized_content
    resources = ActiveModel::ArraySerializer.new(Post.published.sorted).as_json | ActiveModel::ArraySerializer.new(Tweet.published.sorted).as_json

    resources.sort_by { |i| i[:published_date] }.reverse
  end

  # A great way to lock down the API with an authorized key.
  # This could easily be swapped with a token or stay static for your own private use
  def authorize_application
    render json: { ok: false, message: 'unauthorized' }, status: 401 unless request.headers['App-Key'] == 'R141p7THbd5vRdH20xb5SaOsN6bJ5J5S'
  end
end