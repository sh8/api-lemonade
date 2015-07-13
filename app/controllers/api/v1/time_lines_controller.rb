class Api::V1::TimeLinesController < ApplicationController
  
  def index
    # 0の部分をcurrent_userのフレンドのPostsを取得するようにする
    posts = Post.where('user_id = ?', 0).includes(:user, :restaurant).order('created_at desc')
    render :json => posts.to_json(:include => {:user => {:only => [:id, :name, :profile_photo]}, :restaurant => {:only => [:id, :name, :tel, :address, :genre]}})
  end

end
