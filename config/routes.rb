Rails.application.routes.draw do
  resources :pregunta
  devise_for :users
  root 'pregunta#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
