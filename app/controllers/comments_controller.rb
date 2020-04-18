class CommentsController < ApplicationController

  def create
    @pregunta = Preguntum.where(id: params[:id]).take
    puts @pregunta.id
    @comment_post = @pregunta.comments.create(params_comment)
    # Instance vars to render if failed to save comment
    @comment = Comment.new
    @comments = @pregunta.comments.order(created_at: :desc)

    if @comment_post.save
      redirect_to preguntum_path(@pregunta), notice: 'Comentario agregado'
    else
      render 'pregunta/show'
    end
  end

  private
  def params_comment
    params.require(:comment).permit(:body).merge(user: current_user)
  end
end
