class PreguntaController < ApplicationController
  before_action :authenticate_user!,  only: [:edit, :update, :destroy, :create, :new]
  
  def index
    @preguntas = Preguntum.all
  end

end
