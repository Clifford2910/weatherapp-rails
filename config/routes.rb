Rails.application.routes.draw do
  root 'home#index'
  get 'city_search', to: 'home#search'

  get '/dark_mode', to: 'application#dark_mode', as: 'dark_mode'
  get '/light_mode', to: 'application#light_mode', as: 'light_mode'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
