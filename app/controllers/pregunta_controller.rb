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
      @errores = @pregunta.errors.full_messages
      render :new
    end
  end

  def show
    @pregunta = Preguntum.find(params[:id])
    @comment = Comment.new
    @answer = Answer.new
    
    @comments = @pregunta.comments.order(created_at: :desc)
    @answers_questions = @pregunta.answers.order(created_at: :desc)
  end

  private
  def params_pregunta
    params.require(:preguntum).permit(:title, :body).merge(user: current_user)
  end

end
