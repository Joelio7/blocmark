class IncomingController < ApplicationController
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_filter :authenticate_user!

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(user_id: @user, title: params[:subject])
    @url = "http://#{params['body-plain']}"

    @user = User.create(email: params[:sender], password: "#{params[:title]}_blocmarks") if @user.nil?
    @topic = Topic.create(title: params[:subject], user_id: @user.id) if @topic.nil?

    @bookmark = Bookmark.create( url: params['body-plain'])
    @bookmark.update_attributes(topic_id: @topic.id)

    head 200
  end
end
