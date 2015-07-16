class Api::V1::TimeLinesController < ApplicationController
  
  def index
    # 0の部分をcurrent_userのフレンドのPostsを取得するようにする
    posts = Post.where('user_id = ?', 0).includes(:user, :restaurant => :master_genre).order('created_at desc')
    json = []
    posts.each do |p|
      json << {
        "restaurant_id" => p.restaurant_id,
        "id" => p.id,
        "restaurant" => {
          "address" => p.restaurant.address,
          "id" => p.restaurant.id,
          "tel" => p.restaurant.tel,
          "name" => p.restaurant.name,
          "genre" => p.restaurant.genre
        },
        "user_id" => p.user_id,
        "photo" => {"url" => p.photo.url},
        "user" => {
          "name" => p.user.name,
          "profile_photo" => {"url" => p.user.profile_photo.url}
        }
      }
    end

    render :json => json
  end
end
