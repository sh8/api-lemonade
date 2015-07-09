Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      # restaurants/
      get 'restaurants/search' => 'restaurants#search'
      get 'restaurants/near' => 'restaurants#near'

      # posts/
      get 'posts' => 'posts#index'
      post 'posts/create' => 'posts#create'

      #users/
      post 'users/sign_up' => 'users#sign_up'

      # time_lines/
      get 'time_lines' => 'time_lines#index'
  
    end
  end
end
