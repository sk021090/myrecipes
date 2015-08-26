Rails.application.routes.draw do
    
  get 'reecipes/index'

  get 'reecipe/index'

  get 'reecipes/index'

    root 'pages#home'
    
  get '/home', to: 'pages#home'
  
    resources :reecipes
 end
    