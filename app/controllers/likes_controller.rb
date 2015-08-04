class LikesController < ApplicationController

  def create
    @topic = Topic.friendly.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.build(bookmark: @bookmark)
    authorize @like
    if @like.save
      redirect_to(request.referrer || @topic)
    else
      flash[:error] = "There was an error liking the bookmark.  Please try again."
      render :new
    end
  end

  def destroy
    @topic = Topic.friendly.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.liked(@bookmark)
    authorize @like
    if @like.destroy
      redirect_to(request.referrer || @topic)
    else
      flash[:error] = "There was an error un-liking the bookmark.  Please try again."
      redirect_to @topic
    end
  end
  
end
