class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  def upvote
    # Add 1 to the votes column
    @question = Question.find(params[:id])
    @question.votes += 1
    if @question.save
      flash[:notice] = "Thanks for your vote!"
      redirect_to questions_path
    else
      flash[:notice] = "No"
    end
  end

  def downvote
  end
end
