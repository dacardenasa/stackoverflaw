class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @pregunta = Preguntum.where(id: params[:id]).take
    @comment_post = @pregunta.comments.create(params_comment)

    if @comment_post.save
      redirect_to preguntum_path(@pregunta), notice: 'Comentario agregado a la pregunta'
    else
      # Instance vars to render if failed to save comment
      @comment = Comment.new
      @answer = Answer.new
      @comments = @pregunta.comments.order(created_at: :desc)
      @answers_questions = @pregunta.answers.order(created_at: :desc)
      @errores = @comment_post.errors.full_messages
      render 'pregunta/show'
    end
  end

  def comment_answer
    @answer = Answer.where(id: params[:id]).take
    @pregunta = @answer.preguntum
    @comment_ans = @answer.comments.create(params_comment)

    if @comment_ans.save
      redirect_to preguntum_path(@pregunta), notice: 'Comentario agregado a la respuesta'
    else
      # Instance vars to render if failed to save comment
      @comment = Comment.new
      @answer = Answer.new
      @comments = @pregunta.comments.order(created_at: :desc)
      @answers_questions = @pregunta.answers.order(created_at: :desc)
      @errores = @comment_ans.errors.full_messages
      render 'pregunta/show'
    end
  end

  private
  def params_comment
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
