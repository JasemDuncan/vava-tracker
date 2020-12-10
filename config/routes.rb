Rails.application.routes.draw do
  devise_for :users
  # get 'transaction/index'
  # get 'transaction/show'
  resources :transactions

  #get 'group/index'
  resources :groups

  resources :users

  # get 'users/index'
  # get 'users/login'
  # get 'users/splash'
  # post 'users/splash'
  # post 'users/login'  
  
  root 'welcome#index'

end
