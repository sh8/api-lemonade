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
    restaurant = Restaurant.find(params[:id])
    render :json => restaurant.posts.last(5).order('created_at asc').to_json(:include => {:user => {:only => [:id, :name, :profile_photo]}})
  end
end
