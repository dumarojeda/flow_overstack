class CommentsController < ApplicationController
  def create
    if params.has_key?(:answer_id)
      @answer = Answer.find(params[:answer_id])
      
      @question = Question.find(@answer.question.id)
      @comment = @answer.comments.new(comment_params)      
    else
      @question = Question.find(params[:question_id])
      @comment = @question.comments.new(comment_params)
    end

    if @comment.save
      redirect_to @question
    else
      @errors = @comment.errors.full_messages
      render "questions/show"
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:description).merge(user_id: current_user.id)
    end
end
