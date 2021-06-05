Rails.application.routes.draw do

root :to => 'homes#top'
get '/about' => 'homes#about'

resource :customers, only: [:edit, :update]
get '/customers/my_page' => 'customers#show'
patch 'customers/edit' => 'customers#update'
get '/customers/unsubscribe' => 'customers#unsubscribe'
patch '/customers/withdrawal' => 'customers#withdrawal'

resources :items, only: [:index, :show]

post '/orders/confirm' => 'orders#confirm'
get '/orders/thanks' => 'orders#thanks'
resources :orders, only: [:new, :create, :index, :show]

#resources :order_items, only: [:index, :edit, :create, :update, :destroy]
resources :addresses, only: [:index, :edit, :create, :update, :destroy]

resources :cart_items, only: [:index, :update, :create]
delete '/cart_items/:id' => 'cart_items#destroy'
delete '/cart_items/destroy_all' => 'cart_items#destroy_all'


#post '/customers/sign_up' => 'customers/registrations#create'

namespace :admin do
  resources :items, except: [:create]
  post '/items/new' => 'items#create'
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  get '/' => 'homes#top'
end

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

end
