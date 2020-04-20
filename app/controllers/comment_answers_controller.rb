class CommentAnswersController < ApplicationController

  def create
    @answers = Answer.where(id: params[:id]).take
    @comment_answer = @answers.CommentAnswers.create(params_comment_answers)
    @comment = Comment.new
    @answer = Answer.new
    @pregunta = @answers.preguntum
    
    @comments = @pregunta.comments.order(created_at: :desc)
    @answers_questions = @pregunta.answers.order(created_at: :desc)
    # @comment_answers = @answer.comment_answers.order(created_at: :desc)

    if @comment_answer.save
      redirect_to preguntum_path(@pregunta), notice: "Comentario agregado con exito"
    else
      render 'pregunta/show'
    end

  end

  private
  def params_comment_answers
    params.require(:comment_answer).permit(:body).merge(user: current_user)
  end
end
