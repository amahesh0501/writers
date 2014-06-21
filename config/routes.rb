Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  root :to => 'pages#home'

  resources :clients
  resources :earnings
  resources :editors
  resources :freelancers
  resources :jobs do
  	resources :bids
    resources :messages
    resources :submissions
  end
  resources :payments

  get '/claim_job_writer', to: 'jobs#claim_job_writer'
  get '/claim_job_editor', to: 'jobs#claim_job_editor'
  get '/complete_job', to: 'jobs#mark_job_as_completed'
  get '/score_writer', to: 'jobs#score_writer'
  get '/score_editor', to: 'jobs#score_editor'


end
