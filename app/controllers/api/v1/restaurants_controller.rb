class Api::V1::RestaurantsController < ApplicationController

  def search
    lat = params[:lat]
    lon = params[:lon]
    restaurants = Restaurant.search(lat, lon)

    render :json => restaurants
  end

end
