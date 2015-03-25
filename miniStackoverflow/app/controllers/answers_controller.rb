class AnswersController < ApplicationController

  def create
    @answer= Answer.new(answer_params)
    @answer.save
    redirect_to question_path(answer_params[:question_id])
  end

  private
  def answer_params
  params.require(:answer).permit(:title,:content,:question_id)
  end
end
