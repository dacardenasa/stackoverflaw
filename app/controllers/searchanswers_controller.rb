class SearchanswersController < ApplicationController
  def show 
    question = Preguntum.arel_table
    searchs = Preguntum.where(question[:title].matches("%#{params[:search]}%"))
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
