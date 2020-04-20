class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @pregunta = Preguntum.where(id: params[:id]).take
    @comment_post = @pregunta.comments.create(params_comment)

    if @comment_post.save
      redirect_to preguntum_path(@pregunta), notice: 'Comentario agregado'
    else
      # Instance vars to render if failed to save comment
      @comment = Comment.new
      @answer = Answer.new
      @comment_answer =  CommentAnswer.new
      @comments = @pregunta.comments.order(created_at: :desc)
      @answers_questions = @pregunta.answers.order(created_at: :desc)
      @errores = @comment_post.errors.full_messages
      render 'pregunta/show'
    end
  end

  private
  def params_comment
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
