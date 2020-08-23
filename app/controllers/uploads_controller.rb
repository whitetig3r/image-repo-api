class UploadsController < ApplicationController
  before_action :authenticate_user
  before_action :set_upload, only: [:show, :update, :destroy]

  def index
    @uploads = Upload.where(user_id: current_user.id)
  end

  def show
    unless @upload.visual_asset.attached?
      render :no_attached_asset
    end
  end

  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      render :show, status: :created
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end

  def update
    if @upload.update(upload_params)
      render :show, status: :ok, location: @upload
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @upload.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upload_params
      params.permit(:title, :caption, :visual_asset, :public).merge(user_id: current_user.id)
    end
end
