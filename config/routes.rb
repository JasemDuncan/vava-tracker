Rails.application.routes.draw do
  # get 'transaction/index'
  # get 'transaction/show'
  resources :transaction

  #get 'group/index'
  resources :group

  get 'user/index'
  get 'user/login'
  get 'user/splash'
  post 'user/splash'
  post 'user/login'  
  
  root 'user#splash'

end
