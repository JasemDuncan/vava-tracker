Rails.application.routes.draw do
  devise_for :users
  # get 'transaction/index'
  # get 'transaction/show'
  resources :transactions
  get 'external', to: 'transactions#external', as: 'external'
  #get 'group/index'
  resources :groups   
  root 'welcome#index'
end
