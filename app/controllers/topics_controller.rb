class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks.all
    @bookmark = Bookmark.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:notice] = "Topic was saved."
      redirect_to topics_path
    else
      flash[:error] = "There was an error saving the topic.  Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end  

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:notice] = "Topic was updated."
      redirect_to @topic
    else
      flash[:error] = "There was an error updating the topic.  Please try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    if @topic.destroy
      flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic.  Please try again."
      redirect_to @topic
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :user)
    end
end
