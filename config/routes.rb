Rails.application.routes.draw do
  # Nested route to create comments about user question
  post "/pregunta/:id/comments", to: "comments#create", as: "comments"
  # Nested route to create comments about users answers
  post "/pregunta/:id/comments_answer", to: "comments#comment_answer", as: "comment_answers"
  # Nested route to create answers about user question
  post "/pregunta/:id/answers", to: "answers#create", as: "answers"
  # Route to get data search questions en DB
  get "/searchanswers/show", to: "searchanswers#show", as: "searchanswers"
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
  root "pregunta#index"
  # Redireccionar rutas desconocidas desde la url
  get "*path" => redirect("/")
end
