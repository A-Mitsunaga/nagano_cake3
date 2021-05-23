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
namespace :admin do
  resources :items, only: [:new,:index, :show, :edit, :update, :destroy]
  post '/items/new' => 'items#create'
end

end
