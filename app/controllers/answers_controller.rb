class AnswersController < ApplicationController
  def create

    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to @question
    else
      @errors = @answer.errors.full_messages
      render "questions/show"
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:description).merge(user_id: current_user.id)
    end
end
