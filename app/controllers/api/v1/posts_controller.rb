class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!

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
