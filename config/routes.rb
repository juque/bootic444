Rails.application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/auth/logout', to: 'sessions#destroy', as: :logout
  get 'dashboard', to: 'dashboard#index'
  root 'welcome#index'
end
