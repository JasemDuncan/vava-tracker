Rails.application.routes.draw do
  get 'transaction/index'
  get 'group/index'
  get 'user/index'
  
  root 'user#login'

end
