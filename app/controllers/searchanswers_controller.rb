class SearchanswersController < ApplicationController
  def show 
    searchs = Preguntum.all.where("title LIKE ?", "%#{params[:search]}%")
    if searchs.count > 0
      @questions = searchs
      render 'pregunta/index'
    else
      @preguntas = Preguntum.all
      flash.now[:notice] = 'No se encuentran preguntas'
      render 'pregunta/index'
    end
  end
end
