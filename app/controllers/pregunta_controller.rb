class PreguntaController < ApplicationController
  before_action :authenticate_user!,  only: [:edit, :update, :destroy, :create, :new]
  
  def index
    @preguntas = Preguntum.all
  end

  def new
    @pregunta = Preguntum.new
  end

  def create
    @pregunta = Preguntum.create(params_pregunta);
    if @pregunta.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @pregunta = Preguntum.find(params[:id])
    @comments = @pregunta.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  private
  def params_pregunta
    params.require(:preguntum).permit(:title, :body).merge(user: current_user)
  end

end
