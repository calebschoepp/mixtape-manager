Rails.application.routes.draw do
  # Resources
  resources :playlists

  # Static pages
  get 'landing', to: 'static#landing' # TODO: Fix me
  get 'help', to: 'static#help'
  
  # TODO: Fix
  root 'playlists#index'
  get '/dashboard', to: 'playlists#index'
end
