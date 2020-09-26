class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @answer = Answer.new(answer_params)
    @question = @answer.question
    if @answer.save
      respond_to :js
    else
      flash[:alert] = "コメントに失敗しました"
    end
  end

  def destroy
    @answer = Answer.find_by(id: params[:id])
    @question = @answer.question
    if @answer.destroy
      respond_to :js
    else
      flash[:alert] = "コメントの削除に失敗しました"
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :question_id, :answer)
  end
end
