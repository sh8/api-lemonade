class Api::V1::PostsController < ApplicationController

  def index
    @posts = Post.where('user_id = ?', params[:user_id].to_i)
    render :json => @posts
  end

  def create
    @post = Post.new
    @post.photo = params[:file]
    @post.user_id = params[:user_id].to_i
    @post.save
    render :json => ["error"]
  end
end
