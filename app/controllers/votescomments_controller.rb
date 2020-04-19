class VotescommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    pregunta = Preguntum.find(params[:preguntum_id])
    pregunta.votecomments.create(user: current_user)

    redirect_to preguntum_path(pregunta)
  end

  def destroy
    pregunta = Preguntum.find(params[:preguntum_id])
    pregunta.votecomments.where(user: current_user).take.try(:destroy)

    redirect_to preguntum_path(pregunta)
  end
end
