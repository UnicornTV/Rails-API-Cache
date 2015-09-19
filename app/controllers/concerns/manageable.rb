#
# Consolidated CMS-like Functionality
#
module Manageable
  extend ActiveSupport::Concern

  included do
    before_action :identify_model, only: [:create, :new, :show, :index, :edit, :update, :destroy, :manage]
    before_action :set_resource, only: [:show, :edit, :update, :destroy]
    before_action :authorize_action, only: [:create, :new, :index, :edit, :update, :destroy, :manage]
    before_action :handle_attachments, only: [:create, :update]

    def index
      @resources = @model.all.decorate

      respond_to do |format|
        format.html { render :index }
        format.rss { render layout: false }
      end
    end

    def show
      @resource = @resource.decorate
    end

    # Admin Only
    def create
      @resource = @model.new(allowed_params)

      if @resource.save
        redirect_to @resource, notice: t('resource.created')
      else
        render :new
      end
    end

    def new
      @resource = @model.new
    end

    def edit
    end

    def update
      if @resource.update(allowed_params)
        redirect_to @resource, notice: t('resource.updated')
      else
        render :edit
      end
    end

    def destroy
      @resource.destroy
      redirect_to polymorphic_path(@resource), notice: t('resource.deleted')
    end

    private

    def identify_model
      @model = params[:resource].constantize
    end

    def authorize_action
      @resource ||= @model.new
      authorize! params['action'].to_sym, @resource, message: t('error.unauthorized')
    end

    # Use callbacks to share common setup or constraints between actions.
    # Find by permalink OR id
    # Resource is defined in routes file as a default param
    def set_resource
      klass = @model
      @resource = klass.find(params[:id])
    end

    # Handle file updloads
    def handle_attachments
      attachment = params[@resource.model_name.singular]['media']

      return unless params[@resource.model_name.singular]['media'].present?

      filename = @resource.id.to_s + '-' + attachment.original_filename.downcase
      bucket = Manticore::S3.bucket(ENV['S3_BUCKET'])
      upload = bucket.object(filename).put(body: attachment.tempfile, content_type: attachment.content_type, acl: 'public-read')

      @resource.photo = bucket.object(filename).public_url
      params[@resource.model_name.singular]['photo'] = bucket.object(filename).public_url
    end

    def publishable_params
      [
        :published,
        :published_date,
        :type,
        :author,
        :share_text,
        :description,
        :photo,
        :profile,
        :handle,
      ]
    end
  end
end
