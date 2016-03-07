class ThumbsController < ApplicationController

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.thumbs.create
    render json: {new_thumb_count: @photo.thumbs.count}
  end

end
