Rails.application.routes.draw do

root :to => 'homes#top'
get '/about' => 'homes#about'
get '/customers/my_page' => 'customers#show'
get '/customers/unsubscribe' => 'customers#unsubscribe'
patch '/customers/withdrawal' => 'customers#withdrawal'

resources :customers, only: [:edit, :update]
resources :items, only: [:index, :show]

#resources :orders, only: [:new, :create, :index, :show]
#post '/orders/confirm' => 'orders#confirm'
#get '/orders/thanks' => 'orders#thanks'

resources :cart_items, only: [:index, :update, :create]
delete '/cart_items/:id' => 'cart_items#destroy'
delete '/cart_items/destroy_all' => 'cart_items#destroy_all'

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

#post '/customers/sign_up' => 'customers/registrations#create'

namespace :admin do
  resources :items, except: [:create]
  post '/items/new' => 'items#create'
  post '/genres/new' => 'genres#create'
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  get '/' => 'homes#top'
end


end
