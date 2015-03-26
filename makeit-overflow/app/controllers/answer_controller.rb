class AnswerController < ApplicationController

	def edit
		@answer = Answer.find(params[:id])
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

end
