Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'sort/:method', to: 'items#sort'
      get 'search/:keyword', to: 'items#search'
      post '/login', to: "login#login"
      get '/fav_list', to: 'items#fav_list'
      post '/fav_list/create', to: 'favorites#create'
      get '/users/:id', to: 'users#show'
      post '/messages', to: 'messages#create'
      get '/conversations', to: 'messages#conversations'
      get '/conversations/:item_id/:user_id', to: 'messages#conversation'
      put 'reactivate/:item_id', to: 'items#reactivate'
      resource :profile, only: [:show, :update]
      resources :detail_images, only: [:create, :destroy, :show]
      resources :items, only: [:index, :show, :create, :update, :destroy] do
        resources :connections, only: [:show, :create, :destroy]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
