#
# Consolidated API Functionality
#
module Digestible
  extend ActiveSupport::Concern

  included do
    before_action :identify_model
    before_action :set_resources, only: [:index]

    def index
      render json: @resources
    end

    private

    def identify_model
      @model = params[:resource].constantize
    end

    def set_resources
      @resources = @model.published.sorted
    end
  end
end