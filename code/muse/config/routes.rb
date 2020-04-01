Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'artists#index'
  resources :artists, :songs
  # get "artists", to: "artists#index"

  get "songs/new", to: "songs#new"
  get "bootstrap", to: "artists#bootstrap"

  # get "artists/:id", to: "artists#show", as: :artist
end
