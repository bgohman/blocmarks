class IncomingController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"
    @user = User.find_by email: params[:sender]
    @topic = Topic.find_by title: params[:subject]
    @url = params["body-plain"]

    if @user.nil?
      @user = User.new(
        name: "New User",
        email: params[:sender]
      )
      @user.skip_confirmation!
      @user.save!
    end

    if @topic.nil?
      @topic = Topic.create(
        title: params[:subject]
        )
      @topic.save!
    end 

    @bookmark = Bookmark.create(
      url: @url,
      topic_id: @topic.id
      )
     @bookmark.save!

     head 200
  end
end
