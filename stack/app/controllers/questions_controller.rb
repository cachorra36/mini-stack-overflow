class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: :index

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

  def vote(value, vote_type)
    # Add 1 to the votes column
    @question = Question.find(params[:id])
    @vote = Vote.create(value: value, vote_type: @question, user_id: current_user.id)
    if @vote.save
      flash[:notice] = "Thanks for your #{vote_type}!"
      redirect_to questions_path
    else
      flash[:notice] = "You can only vote once"
      redirect_to questions_path
    end
  end

  def upvote
    vote(1, "upvote")
  end

  def downvote
    vote(-1, "downvote")
  end
end
