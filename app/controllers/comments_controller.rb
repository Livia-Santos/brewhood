class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @beer = Beer.find(params[:beer_id])
    @comment = Comment.create(params[:comment].permit(:contet))
    @comment.user_id = current_user.id
    @comment.beer_id = @beer.id

    if @comment.save
      redirect_to beer_path(@beer)
    else
      render 'new'
    end
  end
end
