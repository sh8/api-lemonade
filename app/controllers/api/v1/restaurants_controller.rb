class Api::V1::RestaurantsController < ApplicationController

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
end
