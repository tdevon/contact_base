Rails.application.routes.draw do
  get 'companies/index'
  get 'companies/new'
  get 'companies/show'
  get 'companies/edit'
  # Home
  root to:"home#index"

  # Dashboard
  get "dashboard", to: "dashboard#index"

  # Contacts
  resources :contacts
  get '/contacts/:id/add_company', to: "contacts#add_company", as: :add_contact_company

  # Touchpoints
  resources :contacts do
    resources :touchpoints
  end
  get 'contacts/:id/add_call', to: "touchpoints#add_call", as: :add_contact_call
  get 'contacts/:id/add_email', to: "touchpoints#add_email", as: :add_contact_email
  get 'contacts/:id/add_meeting', to: "touchpoints#add_meeting", as: :add_contact_meeting
  get 'contacts/:id/calls', to: "touchpoints#show_calls", as: :show_contact_calls
  get 'contacts/:id/emails', to: "touchpoints#show_emails", as: :show_contact_emails
  get 'contacts/:id/meetings', to: "touchpoints#show_meetings", as: :show_contact_meetings
  get 'contacts/:id/activity', to: "touchpoints#show_activity", as: :show_contact_activity
  
  
  # Pipelines
  resources :pipelines
  get '/pipelines/:id/add_deal', to: "pipelines#add_pipeline_deal", as: :add_pipeline_deal
  
  
  # Advanced Search
  resources :searches

  # Deals
  resources :deals
  get '/deals/:id/add_contacts', to: "deals#add_contacts", as: :add_deal_contacts
  get '/deals/:id/add_company', to: "deals#add_company", as: :add_deal_company

  # Companies
  resources :companies
  get '/companies/:id/add_contacts', to: "companies#add_contacts", as: :add_company_contacts

  # Devise Auth
  devise_for :users, skip: :all
  devise_scope :user do
    get "login", to: "devise/sessions#new", as: :new_user_session
    post "login", to: "devise/sessions#create", as: :user_session
    delete "logout", to: "devise/sessions#destroy", as: :destroy_user_session
    
    get "/users/password/new", to: "devise/passwords#new", as: :new_user_password
    get "/users/password/edit", to: "devise/passwords#edit", as: :edit_user_password
    patch "/users/password", to: "devise/passwords#update", as: :user_password
    put "/users/password", to: "devise/passwords#update"
    post "/users/password", to: "devise/passwords#create"

    get "/users/cancel", to: "devise/registrations#cancel", as: :cancel_user_registration
    get "register", to: "devise/registrations#new", as: :new_user_registration
    get "/users/edit", to: "devise/registrations#edit", as: :edit_user_registration

    patch "/users", to: "devise/registrations#update", as: :user_registration
    put "/users", to: "devise/registrations#update"
    delete "/users", to: "devise/registrations#destroy"
    post "/users", to: "devise/registrations#create"
  end

  
end
