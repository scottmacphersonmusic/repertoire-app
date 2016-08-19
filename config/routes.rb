Rails.application.routes.draw do
  resources :repertoires do
    resources :songs
    post 'update_songs', to: 'songs#update_songs'
    resources :practice_sessions, only: :create
  end

  resources :instruments
  resources :suggestions, only: [:show, :create]

  root 'repertoires#index'
end
