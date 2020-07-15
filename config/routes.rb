Rails.application.routes.draw do
  root 'static_pages#home'
  get 'about', to: 'static_pages#about'
  # for articles define this RESTful actions
  # new, create, index, show, edit, update, destroy
  resources :articles
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users, except: :new
  resources :categories
end

