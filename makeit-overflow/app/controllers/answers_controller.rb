class AnswersController < ApplicationController
  before_action :find_answer, only: [:edit, :update, :destroy]

  def index
  end

  def show
    redirect_to root_path
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new (answer_params)
    @answer.save
    redirect_to question_path(@answer.question_id)
  end

  def edit
    @question = Question.find(@answer.question_id)
  end

  def update
  	if @answer.update(answer_params)
      redirect_to question_path(@answer.question_id)
    else
      render 'update'
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@answer.question_id)
  end

    def upvote
      @answer = Answer.find(params[:id])
      @answer.votes.create
      redirect_to question_path(@answer.question)
    end

    def downvote
      @answer = Answer.find(params[:id])
      @answer.votes.first.destroy if @answer.votes.count > 0
      redirect_to question_path(@answer.question)
    end

    def find_answer
      @answer = Answer.find(params[:id])
    end

    private
    def answer_params
      params.require(:answer).permit(:title, :content, :question_id)
    end
  end
