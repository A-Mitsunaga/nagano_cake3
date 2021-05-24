Rails.application.routes.draw do
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
 namespace :public do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :items, only: [:index, :show]

 end

namespace :admin do
  resources :items, except: [:create]
  post '/items/new' => 'items#create'
  resources :genres, only: [:index, :new, :edit, :update]
  post '/genres/new' => 'genres#create'
end

end
