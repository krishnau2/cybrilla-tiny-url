Rails.application.routes.draw do
  get '/:tiny_url', to: "short_url#show"

  resources :short_url
  post 'short_url/create'
  root 'short_url#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
