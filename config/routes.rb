Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      # restaurants/
      get 'restaurants/search' => 'restaurants#search'
      get 'restaurants/near' => 'restaurants#near'
      get 'restaurants/:id' => 'restaurants#show'

      # posts/
      get 'posts' => 'posts#index'
      post 'posts/create' => 'posts#create'

      #users/
      post 'users/sign_up' => 'users#sign_up'

      # time_lines/
      get 'time_lines' => 'time_lines#index'

      # favorites/
      get 'favorites' => 'favorites#index'
      post 'favorites/create' => 'favorites#create'
      delete 'favorites/:post_id' => 'favorites#destroy'
  
    end
  end
end
