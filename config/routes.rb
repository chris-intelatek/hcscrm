Rails.application.routes.draw do

  get 'healthcare_savings', to: 'pages#healthcare-savings'
  get 'instant_pay', to: 'pages#instant-pay'  
  get 'home', to: 'pages#home'
  get 'docs', to: 'pages#docs'
  get 'marketing', to: 'pages#marketing'
  get 'references', to: 'pages#references'
  get 'articles', to: 'pages#articles'
  get 'training', to: 'pages#training'
  get 'answers', to: 'pages#answers'
  get 'email-sequences', to: 'pages#email-sequences'
  get 'cold-phone-script', to: 'pages#cold-phone-script'
  get 'invite-webinar', to: 'pages#invite-webinar'
  get 'steps-to-sale', to: 'pages#steps-to-sale'
  get 'training-vids', to: 'pages#training-vids'
  get 'lead-generation', to: 'pages#lead-generation'
  get 'lead-generation-faq', to: 'pages#lead-generation-faq'
  get 'intelatek', to: 'prospects#intelatek'
  get 'dashboard', to: 'prospects#dashboard'
  get :new_lead, to: 'prospects#new_lead', as: :new_lead
  post :new_lead, to: 'prospects#new_lead_create', as: :new_lead_create
  get 'hcsq/:id', to: 'prospects#hcsq', as: :hcsq
  post 'hcsq/:id', to: 'prospects#hcsq_update', as: :hcsq_update
  get 'hcs/:id', to: 'prospects#hcs', as: :hcs
  post 'hcs/:id', to: 'prospects#hcs_update', as: :hcs_update  
  get 'cps/:id', to: 'prospects#cps', as: :cps
  post 'cps/:id', to: 'prospects#cps_update', as: :cps_update
  get 'pay/:id', to: 'prospects#pay', as: :pay
  post 'pay/:id', to: 'prospects#pay_update', as: :pay_update
  
  match '/users',     to: 'users#index',  via: 'get'
  match '/users/:id', to: 'users#show',   via: 'get'

  resources :users

  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => 'd'
  resources :prospects do
    resources :comments
    collection { post :import }
  end
  # root 'pages#home'
  root 'users#start_page'
end