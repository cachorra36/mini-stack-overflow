class AnswersController < ApplicationController

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
    @answer.question_id = Question.find(params[:question_id]).id

    @answer.save
    redirect_to question_path(params[:question_id])
  end

	def edit
		@answer = Answer.find(params[:id])
    @questionnew = Question.find(params[:question_id])
	end

	def update
    	@answer = Answer.find(params[:id])
    		if @answer.update(answer_params)
      		redirect_to root_path
    	else
      		render 'update'
    	end
  	end

  	def destroy
  		@answer = Answer.find(params[:id])
  		@answer.destroy
  		redirect_to root_path
  	end

  def answer_params

    params.require(:answer).permit(:title, :content)
  end

end
