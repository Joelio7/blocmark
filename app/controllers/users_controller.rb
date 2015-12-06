class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @topics = @user.topics.includes(:bookmarks)
    @new_bookmark = Bookmark.new
    @liked_bookmarks = @user.liked_bookmarks


end
end
