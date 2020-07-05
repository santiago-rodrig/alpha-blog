Rails.application.routes.draw do
  root 'static_pages#home'
  get 'about', to: 'static_pages#about'
  resources :articles, only: [:show, :index, :new, :create, :edit, :update]
end
