class QuestionsController < ApplicationController
  before_action :fetch_question , only: [:show, :edit, :update, :destroy, :down_vote, :up_vote]

  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
    @answers = Question.find(params[:id]).answers
  end

   def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      redirect_to 'new'
    end
  end

  def update
    @question.update(question_params)
    redirect_to @question
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end

  def up_vote
    # @question.votes.create(value)
    @question.votes.create(value:true)
    redirect_to question_path(params[:id])
  end

  def down_vote
    # @question.votes.last.destroy if @question.votes.count > 0
    @question.votes.create(value:false)
    redirect_to question_path(params[:id])
  end

  private

  # def vote_params
  #   params.require(:vote).permit(:value, :votable_id, :votable_type)
  # end

  def question_params
    params.require(:question).permit(:title, :content, :user)
  end

  def fetch_question
    @question = Question.find(params[:id])
  end

end
