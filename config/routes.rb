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
  get 'lead/:id', to: 'prospects#lead', as: :lead
  post 'lead/:id', to: 'prospects#lead_update', as: :lead_update
  get 'hcsq/:id', to: 'prospects#hcsq', as: :hcsq
  post 'hcsq/:id', to: 'prospects#hcsq_update', as: :hcsq_update
  get 'hcs/:id', to: 'prospects#hcs', as: :hcs
  post 'hcs/:id', to: 'prospects#hcs_update', as: :hcs_update  
  get 'entrust', to: 'prospects#entrust'
  get 'hcs_lead_status/:id', to: 'prospects#hcs_lead_status', as: :hcs_lead_status
  post 'hcs_lead_status/:id', to: 'prospects#hcs_lead_status_update', as: :hcs_lead_status_update
  get 'vcp/:id', to: 'prospects#vcp', as: :vcp
  post 'vcp/:id', to: 'prospects#vcp_update', as: :vcp_update
  get 'branch', to: 'prospects#branch'
  get 'pay/:id', to: 'prospects#pay', as: :pay
  post 'pay/:id', to: 'prospects#pay_update', as: :pay_update
  get 'shipping_profile/:id', to: 'prospects#shipping_profile', as: :shipping_profile
  post 'shipping_profile/:id', to: 'prospects#shipping_profile_update', as: :shipping_profile_update
  get 'shipping/:id', to: 'prospects#shipping', as: :shipping
  post 'shipping/:id', to: 'prospects#shipping_update', as: :shipping_update
  get 'shipstore', to: 'prospects#shipstore'
  get 'shipping_lead_status/:id', to: 'prospects#shipping_lead_status', as: :shipping_lead_status
  post 'shipping_lead_status/:id', to: 'prospects#shipping_lead_status_update', as: :shipping_lead_status_update
  get 'shipping_opportunity_status/:id', to: 'prospects#shipping_opportunity_status', as: :shipping_opportunity_status
  post 'shipping_opportunity_status/:id', to: 'prospects#shipping_opportunity_status_update', as: :shipping_opportunity_status_update  
  get :export_users, to: 'users#export_users', as: :export_users
  
  match '/users',     to: 'users#index',  via: 'get'
  
  # ************** I removed the line below to get Add User to work but not sure what effect it may have down the road ***********
  # match '/users/:id', to: 'users#show',   via: 'get'

  devise_for :users, :controllers => { registrations: 'registrations' }, :path_prefix => 'd'

  resources :users do
    resources :comments
    resources :attachments    
    collection { post :import }
  end

  resources :prospects do
    resources :comments
    resources :attachments    
    collection { post :import }
  end
    root 'pages#home'
  # root 'users#start_page'
end