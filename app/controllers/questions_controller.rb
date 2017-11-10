class QuestionsController < ApplicationController
	def index
		@questions=Question.all
	end
	def show
	end
	def new
		@question = Question.new
	end

	def create
		@question = Question.new(params[:texto]) #texto del cuadro
		if @question.save
			redirect_to questions_path
		else
			render :new
		end
	end
	def edit
	end
	def destroy
		question=Question.find(params[:id])
		question.destroy
		redirect_to questions_path
	end
end
