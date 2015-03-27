class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :find, only: [:show, :edit, :destroy]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
    
  end

   def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path
    else
      render :action => 'new'
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path
  end



  def upvote
    vote(1, "upvote", params[:id], "Question")
  end

  def downvote
    vote(-1, "downvote", params[:id], "Question")
  end
  def find
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)

  end
end
