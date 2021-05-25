Rails.application.routes.draw do

root :to => 'homes#top'
get '/about' => 'homes#about'
get '/customers/my_page' => 'customers#show'
get '/customers/unsubscribe' => 'customers#unsubscribe'
patch '/customers/withdrawal' => 'customers#withdrawal'

resources :items, only: [:index, :show]
resources :customers, only: [:edit, :update]

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

namespace :admin do
  resources :items, except: [:create]
  post '/items/new' => 'items#create'
  resources :genres, only: [:index, :new, :edit, :update]
  post '/genres/new' => 'genres#create'
end

end
