class BookmarksController < ApplicationController
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])

  end

  def new
    @user = User.find(params[current_user])
    @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.bookmarks.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
  @bookmark = current_user.bookmarks.new
    @bookmark = current_user.bookmarks.build(bookmark_params)
    authorize @bookmark
    if @bookmark.save
      flash[:notice] = "Bookmark saved"
      redirect_to @topic
    else
      flash[:error] = "There was an error saving your bookmark"
      redirect_to request.referer
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end
  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:error] = "An error has occured. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = topic.bookmarks.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
      redirect_to request.referer
    else
      flash[:error] = "bookmark was not delete, please try again"
      render :new
    end
    end




  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end


end
