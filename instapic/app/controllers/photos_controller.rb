class PhotosController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_filter :require_permission, :only => [:edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = current_user.photos.new
  end

  def create
    @photo = current_user.photos.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render 'new'
    end
  end

  def photo_params
    params.require(:photo).permit(:name, :image)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to photos_path
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo deleted successfully'
    redirect_to photos_path
  end

  def require_permission
    if current_user != Photo.find(params[:id]).user
      flash[:notice] = 'error'
      redirect_to photos_path
    end
  end

end
