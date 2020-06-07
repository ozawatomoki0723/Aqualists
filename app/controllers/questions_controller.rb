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
      redirect_to questions_path
      flash[:notice] = "質問が保存されました"
    else
      redirect_to root_path
      flash[:alert] = "投稿に失敗しました"
    end
    end
    
    def index
    @questions = Question.all
    end
    
    def destroy
		    @question = Question.find_by(id: params[:id])
		    if @question.user == current_user
		       @question.destroy
		       flash[:notice]="投稿を削除しました"
		    else
			     flash[:notice]="エラーです"
		    end
		    redirect_to questions_path
    end

    private
    def question_params
      params.require(:question).permit(:title, :body, qphotos_attributes: [:image]).merge(user_id: current_user.id)
    end
end
