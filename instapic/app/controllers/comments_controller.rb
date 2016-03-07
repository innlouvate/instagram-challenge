class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find params[:photo_id]
    @comment = @photo.build_comment comment_params, current_user

    if @comment.save
      redirect_to photos_path
    elsif @comment.errors[:user]
      redirect_to photos_path, alert: 'has commented this comment already'
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:description)
  end

end
