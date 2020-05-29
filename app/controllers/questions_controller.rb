class QuestionsController < ApplicationController
	before_action :authenticate_user!
	def new
		@question = Question.new
		@question.qphotos.build
	end

	def create
		@question = Question.new(question_params)
		if @question.qphotos.present?
			@question.save
			redirect_to root_path
			flash[:notice] = "質問が投稿されました"
		else
			redirect_to root_path
			flash[:notice] = "失敗しました"
		end
	end

	def index
		@questions = Question.limit(10)
	end

	private
	def question_params
		params.require(:question).permit(:title,:body, qphotos_attributes: [:image]).merge(user_id: current_user.id)
	end

end

