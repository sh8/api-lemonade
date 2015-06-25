Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      # restaurants/
      get 'restaurants/search' => 'restaurants#search'
      get 'restaurants/near' => 'restaurants#near'

      # posts/
      post 'posts/create' => 'posts#create'

    end
  end
end
