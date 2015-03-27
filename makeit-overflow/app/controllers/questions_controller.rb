class QuestionsController < ApplicationController

	before_action :find_question, only: [:edit, :update, :destroy]



	def index
		@questions = Question.all
		@question = Question.new
		@api = Github::Cliente.new
		@zen = @api.zen

		#@response = HTTParty.get('https://api.github.com/zen', :headers =>  {"User-Agent" => "Nosotros"})
	end

	def show
		@question = Question.find(params[:id])
		@answers = @question.answers
		@answer = Answer.new
	end

	def new
		@question = Question.new
	end

	def create
		@question = Question.new (question_params)
		@question.save
		redirect_to root_path
	end

	def edit
	end

	def update
		if @question.update(question_params)
			redirect_to root_path
		else
			render 'update'
		end
	end

	def destroy
		@question.destroy
		redirect_to root_path
	end

	def upvote
		@question = Question.find(params[:id])
		@question.votes.create
		redirect_to root_path
	end

	def downvote
		@question = Question.find(params[:id])
		
		@question.votes.first.destroy if @question.votes.count > 0 

		redirect_to root_path
	end

	def find_question
		@question = Question.find(params[:id])
	end

	private
	def question_params
		params.require(:question).permit(:title, :content, answer_attributes: [:title, :content])
	end

end
