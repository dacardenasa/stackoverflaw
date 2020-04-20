Rails.application.routes.draw do
  # Nested route to create comments about user question
  post '/pregunta/:id/comments', to: 'comments#create', as: 'comments'
  # Nested route to create answers about user question
  post '/pregunta/:id/answers', to: 'answers#create', as: 'answers'
  # Nested route to create comments about user answer
  post '/pregunta/:id/comment_answers', to: 'comment_answers#create', as: 'comment_answers'
  # Complete routes about pregunta controller
  resources :pregunta do
    # Set route to create and destroy votes to question 
    resource :votescomments, only: [:create, :destroy]
    # Set route to create and destroy votes to answers 
    resource :voteanswers, only: [:create, :destroy]
  end
  # Routes for login users to grant access to the app through devise
  devise_for :users
  # Config view index as root web page from controller pregunta
  root 'pregunta#index'
end
