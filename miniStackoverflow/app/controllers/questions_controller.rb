class QuestionsController < ApplicationController
  before_action :fetch_question , only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
    @ansers = Question.find(params[:id]).answers
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
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :user)
  end

  def fetch_question
    @question = Question.find(params[:id])
  end

end
