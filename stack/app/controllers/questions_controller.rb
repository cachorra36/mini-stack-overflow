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
  end

  def update
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
end
