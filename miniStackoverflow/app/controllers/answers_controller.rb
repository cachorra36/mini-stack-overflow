class AnswersController < ApplicationController
  before_action :fetch_answer , only: [:down_vote, :up_vote]

  def create
    @answer= Answer.new(answer_params)
    @answer.save
    redirect_to question_path(answer_params[:question_id])
  end

  def up_vote
    @answer.votes.create(value:true)
    redirect_to question_path(params[:question_id])
  end

  def down_vote
    @answer.votes.create(value:false)
    redirect_to question_path(params[:question_id])
  end

  def fetch_answer
    @answer = Answer.find(params[:id])
  end

  private
  def answer_params
    params.require(:answer).permit(:title,:content,:question_id)
  end
end
