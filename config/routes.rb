Rails.application.routes.draw do
  post '/pregunta/:id/comments', to: 'comments#create', as: 'comments'
  resources :pregunta
  devise_for :users
  root 'pregunta#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
