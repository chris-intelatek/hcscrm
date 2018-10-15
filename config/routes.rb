Rails.application.routes.draw do
  
  get 'home', to: 'pages#home'
  get 'docs', to: 'pages#docs'
  get 'marketing', to: 'pages#marketing'
  get 'references', to: 'pages#references'
  get 'articles', to: 'pages#articles'
  get 'training', to: 'pages#training'
  get 'answers', to: 'pages#answers'
  get 'email-sequences', to: 'pages#email-sequences'
  get 'invite-webinar', to: 'pages#invite-webinar'
  get 'steps-to-sale', to: 'pages#steps-to-sale'
  get 'training-vids', to: 'pages#training-vids'
  get 'lead-generation', to: 'pages#lead-generation'
  get 'lead-generation-faq', to: 'pages#lead-generation-faq'
  
  get 'dashboard', to: 'prospects#dashboard'
  get :new_lead, to: 'prospects#new_lead', as: :new_lead
  post :new_lead, to: 'prospects#new_lead_create', as: :new_lead_create
  get 'hcsq/:id', to: 'prospects#hcsq', as: :hcsq
  post 'hcsq/:id', to: 'prospects#hcsq_update', as: :hcsq_update
  
  match '/users',     to: 'users#index',  via: 'get'
  match '/users/:id', to: 'users#show',   via: 'get'

  resources :users

  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => 'd'
  resources :prospects do
    resources :comments
  end
  root 'pages#home'
  # root 'users#start_page'
end