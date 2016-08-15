Rails.application.routes.draw do
  resources :repertoires do
    resources :songs
    resources :practice_sessions, only: :create
  end

  resources :instruments
  resources :suggestions, only: [:show, :create]

  root 'repertoires#index'
end
