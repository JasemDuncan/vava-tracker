Rails.application.routes.draw do
  devise_for :users
  # get 'transaction/index'
  # get 'transaction/show'
  resources :transactions
  get 'external', to: 'transactions#external', as: 'external'
  #get 'group/index'
  resources :groups  

  resources :welcome

  # get 'users/index'
  # get 'users/login'
  # get 'users/splash'
  # post 'users/splash'
  # post 'users/login'  
  get 'groups/jasem'
  
  root 'welcome#index'
  mount ReportsKit::Engine, at: '/'

end
