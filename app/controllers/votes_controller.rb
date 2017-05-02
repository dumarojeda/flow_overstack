class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

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

  def destroy
    @question = Question.find(params[:question_id])
    @vote = @question.votes.find_by(user_id: current_user.id)
    @vote.destroy
    redirect_to @question
  end
end
