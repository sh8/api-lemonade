class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:user_id].present?
      @posts = Post.where('user_id = ?', params[:user_id]).order('id desc')
    else
      @posts = Post.where('user_id = ?', current_user.id).order('id desc')
    end
    json = {
      "user" => current_user,
      "posts" => @posts.includes(:user),
      "posts_number" => @posts.count.to_s
    }.to_json
    render :json => json
  end

  def create
    @post = Post.new
    @post.photo = params[:file]
    @post.user_id = params[:user_id].to_i
    @post.restaurant_id = params[:restaurant_id]
    @post.save
    render :json => ["error"]
  end
end
