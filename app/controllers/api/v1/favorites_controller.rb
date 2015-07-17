class Api::V1::FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where('user_id = ?', current_user.id).order('created_at desc')
    posts = {
      "favorites" => @favorites.map{|f| {"post" => {"photo" => {"url" => f.post.photo.url}, "restaurant_id" => f.post.restaurant_id}}}
    }
    render :json => posts
  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = current_user.id
    @favorite.post_id = params[:post_id]
    if @favorite.save!
      render :json => @favorite, :status => "ok"
    else
      render :json => @favorite.errors.full_messages, :status => "fail"
    end
  end

  def destroy
    @favorites = Favorite.where('user_id = ? and post_id = ?', current_user.id, params[:post_id])
    if @favorites.destroy_all
      render :json => "completed", :status => "ok"
    else
      render :json => @favorite.errors.full_messages, :status => "fail"
    end
  end

end
