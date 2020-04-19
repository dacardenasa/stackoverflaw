class VoteanswersController < ApplicationController
  before_action :authenticate_user!

  def create
    answer = Answer.find(params[:preguntum_id])
    answer.voteanswers.create(user: current_user)

    redirect_to preguntum_path(answer.preguntum.id)
  end

  def destroy
    answer = Answer.find(params[:preguntum_id])
    answer.voteanswers.where(user: current_user).take.try(:destroy)

    redirect_to preguntum_path(answer.preguntum.id)
  end
end
