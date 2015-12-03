class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize Like
    if like.save
      flash[:notice] = "bookmark liked"
    else
      flash[:error] = "Unsuccessful, try again."
    end
    redirect_to request.referer
  end



  def destroy

    like = Like.find(params[:id])
    authorize Like
    if like.destroy
      flash[:notice] = "bookmark unliked"
    else
      flash[:error] = "Unsuccessful, try again."
    end
    redirect_to request.referer
  end

end
