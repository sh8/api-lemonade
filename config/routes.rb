Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'restaurants/search' => 'restaurants#search'
    end
  end
end
