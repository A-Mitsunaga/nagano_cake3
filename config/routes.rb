Rails.application.routes.draw do

root :to => 'homes#top'
get '/about' => 'homes#about'
get '/customers/my_page' => 'customers#show'
get '/customers/unsubscribe' => 'customers#unsubscribe'
patch '/customers/withdrawal' => 'customers#withdrawal'

resources :customers, only: [:edit, :update]
resources :items, only: [:index, :show]

devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
#admins→adminに変更
devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

#post '/customers/sign_up' => 'customers/registrations#create'

namespace :admin do
  resources :items, except: [:create]
  post '/items/new' => 'items#create'
  resources :genres, only: [:index, :new, :edit, :update]
  post '/genres/new' => 'genres#create'
  resources :customers, only: [:index, :show, :edit, :update]
end


end
