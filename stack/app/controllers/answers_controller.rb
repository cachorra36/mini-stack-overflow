class AnswersController < ApplicationController
  def show
  	 @answer = Answer.find(params[:id])
  end

  def new
  end

  def edit
  end

  def destroy
  	@answer = Answer.find(params[:id])
  	@answer.destroy
  end
end
