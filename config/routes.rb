Rails.application.routes.draw do

  root :to => 'pages#home'

  resources :clients
  resources :earnings
  resources :editors
  resources :freelancers
  resources :jobs
  resources :payments

end
