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
    restaurant = Restaurant.includes(:posts).find(params[:id])
    photos = restaurant.posts.where('photo is not null')
    json = {
      "posts" => restaurant.posts.includes(:user).order('created_at desc'),
      "firstPhoto" => photos.first.photo.url,
      "secondPhoto" => photos.first.photo.url,
    }

    render :json => json
  end

end
