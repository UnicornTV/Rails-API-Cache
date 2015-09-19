#
# Tweets
#
class TweetsController < ApplicationController
  include Manageable

  def create
    @resource = @model.new(allowed_params)

    if @resource.save
      redirect_to @resource, notice: t('resource.created')
    else
      render :new
    end
  end

  def data
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_ACCESS_TOKEN']
      config.consumer_secret     = ENV['TWITTER_ACCESS_TOKEN_SECRET']
      config.access_token        = ENV['TWITTER_CONSUMER_KEY']
      config.access_token_secret = ENV['TWITTER_CONSUMER_SECRET']
    end

    respond_to do |format|
      format.json { render json: client.status(params[:identifier]), serializer: false }
    end
  end

  private

  def allowed_params
    custom_params = [
      :identifier,
      :url,
    ]

    params.require(:tweet).permit(publishable_params | custom_params)
  end
end
