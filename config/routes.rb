Rails.application.routes.draw do
  post 'short_url/create'
  root 'short_url#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
