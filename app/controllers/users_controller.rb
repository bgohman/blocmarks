class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_bookmarks = @user.bookmarks
    @likes = Like.where(user_id: @user.id)
    @liked_bookmarks = []
    @likes.each do |like|
      @liked_bookmarks << Bookmark.find_by(id: like.bookmark_id )
    end
    @liked_bookmarks
  end
end
