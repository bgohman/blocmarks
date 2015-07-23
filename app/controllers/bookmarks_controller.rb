class BookmarksController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new( bookmark_params )
    authorize @bookmark
    @bookmark.topic = @topic
    @bookmark.user = current_user
    if @bookmark.save
      flash[:notice] = "bookmark was created."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the bookmark. Please try again."
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:topic_id]) 
    @bookmark = bookmark.find(params[:id])
    authorize @bookmark
  end

  def edit
    @topic = Topic.find(params[:topic_id]) 
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      flash[:notice] = "bookmark was updated."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the bookmark.  Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])    
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "bookmark was deleted."
    else
      flash[:error] = "There was an error deleting the bookmark.  Please try again."
    end 
      redirect_to @topic
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end