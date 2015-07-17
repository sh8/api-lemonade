class Api::V1::RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def search
    lat = params[:lat]
    lon = params[:lon]

    restaurants = Restaurant.search(lat, lon)

    render :json => restaurants
  end

  def near
    lat = params[:lat]
    lon = params[:lon]
    limit = params[:limit]
    start = params[:start]
    query = params[:query]

    restaurants = Restaurant.near(lat, lon, start, limit, query)

    render :json => restaurants
  end

  def show
    restaurant = Restaurant.includes(:posts => :user).find(params[:id])
    posts = restaurant.posts
    photos = posts.where('photo is not null')
    json = {
      "posts" => posts.order('created_at desc').map {|p| {"photo" => {"url" => p.photo.url}, "user" => {'name' => p.user.screen_name, "profile_photo" => {"url" => p.user.profile_photo.url}}}},
      "firstPhoto" => photos.first.photo.url,
      "secondPhoto" => photos.first.photo.url,
    }

    render :json => json
  end

end
