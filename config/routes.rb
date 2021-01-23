Rails.application.routes.draw do
  devise_for :users
  resources :transactions
  get 'external', to: 'transactions#external', as: 'external'  
  resources :groups   
  root 'welcome#index'
end
