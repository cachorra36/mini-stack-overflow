class QuestionsController < ApplicationController
  before_action :fetch_question , only: [:show, :edit, :update, :destroy]


  def index
    @questions = Question.all
  end

  def show
    # @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    # @question = Question.find(params[:id])
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
    # @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to @question
  end

  def destroy
    # @question = Question.find(params[:id])
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
