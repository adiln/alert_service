Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tickets#index'
  resources :tickets, only: [:index, :show, :create]
end
