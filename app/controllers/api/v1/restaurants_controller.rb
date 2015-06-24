class Api::V1::RestaurantsController < ApplicationController

  def search
    lat = params[:lat]
    lon = params[:lon]

    restaurants = Restaurant.search(lat, lon, limit, start)

    render :json => restaurants
  end

  def near
    lat = params[:lat]
    lon = params[:lon]
    limit = params[:limit]
    start = params[:start]

    restaurants = Restaurant.search(lat, lon, start, limit)

    render :json => restaurants
  end

end
