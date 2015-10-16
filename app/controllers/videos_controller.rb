#
# Video
#
class VideosController < ApplicationController
  include Manageable

  private

  def allowed_params
    custom_params = [:name, :description, :mp4, :category, :cover]
    params.require(:video).permit(publishable_params | custom_params)
  end
end
