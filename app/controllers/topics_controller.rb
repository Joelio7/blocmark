class TopicsController < ApplicationController


  def show
    @topic = Topic.find(params[:id])
    @new_bookmark = Bookmark.new

  end

  def new
    @topic = Topic.new
  end

  def create


      @topic = Topic.new(topic_params)
      @topic.user = current_user
      authorize @topic
      if @topic.save
      flash[:notice] = "Topic was saved"
      redirect_to request.referer
    else
      flash[:error] = "There was an error saving your topic. Please try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to request.referer
    else
      flash[:error] = "topic was not delete, please try again"
      render :new
    end
  end


  def edit

  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end
end
