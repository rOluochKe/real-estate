Rails.application.routes.draw do
  resources :commercial_units
  devise_for :users
  resources :users, only: [:index, :show]
  resources :houses
  resources :complex_buildings
  root 'static_pages#home'
  get '/about_us' => 'static_pages#about'
end
