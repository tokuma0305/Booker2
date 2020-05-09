Rails.application.routes.draw do
  get 'home/top'
  get 'home/about'
  devise_for :users
  root 'home#top'
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :home, only: [:top, :about]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
