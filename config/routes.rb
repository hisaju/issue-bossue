Rails.application.routes.draw do

  get 'auth/github/callback', to: 'sessions#callback'

  namespace :user, shallow: true do
    root 'bossues#index'
    resources :bossues do
      get :issues, on: :collection
      get '/issues/:issue_number', to: 'bossues#issue', as: 'issue', on: :collection
      resources :bossue_applications, only: %i[create]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "tops#index"
end
