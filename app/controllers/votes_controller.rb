class VotesController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @vote = @question.votes.new(params[:vote])
    @vote.user_id = current_user.id
    if @vote.save
      redirect_to @question
    else
      render "questions/show"
    end
  end
end
