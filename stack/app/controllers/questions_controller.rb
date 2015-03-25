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
    @vote = Vote.create(value: 1, vote_type: @question, user_id: current_user)
    if @vote.save
      flash[:notice] = "Thanks for your upvote!"
      redirect_to questions_path
    else
      flash[:notice] = "You can only vote once"
    end
  end

  def downvote
    @question = Question.find(params[:id])
    @vote = Vote.create(value: -1, vote_type: @question, user_id: current_user)
    if @vote.save
      flash[:notice] = "Thanks for your downvote!"
      redirect_to questions_path
    else
      flash[:notice] = "You can only vote once"
    end
  end
end
