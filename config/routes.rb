Rails.application.routes.draw do
  post '/pregunta/:id/comments', to: 'comments#create', as: 'comments'
  post '/pregunta/:id/answers', to: 'answers#create', as: 'answers'
  resources :pregunta do
    resource :votescomments, only: [:create, :destroy]
    resource :voteanswers, only: [:create, :destroy]
  end
  devise_for :users
  root 'pregunta#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
