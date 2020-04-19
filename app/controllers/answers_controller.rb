class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @pregunta = Preguntum.where(id: params[:id]).take
    @answer_post = @pregunta.answers.create(params_answers)

    # Instance vars to render if failed to save comment
    @comment = Comment.new
    @answer = Answer.new
    @comments = @pregunta.comments.order(created_at: :desc)
    @answers_questions = @pregunta.answers.order(created_at: :desc)

    if @answer_post.save
      redirect_to preguntum_path(@pregunta), notice: 'Respuesta agregada'
    else
      render 'pregunta/show'
    end
  end

  private
  def params_answers
    params.require(:answer).permit(:body).merge(user: current_user)
  end

end
