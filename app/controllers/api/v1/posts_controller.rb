class Api::V1::PostsController < ApplicationController

  def create
    @post = Post.new
    @post.photo_url = params[:file]
    @post.user_id = params[:user_id].to_i
    @post.save
    render :json => ["error"]
  end
end
