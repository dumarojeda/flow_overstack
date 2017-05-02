class VotesController < ApplicationController
  def create
    if params.has_key?(:answer_id)
      @answer = Answer.find(params[:answer_id])
      @question = @answer.question.id
      @vote = @answer.votes.new(params[:vote])
    else 
      @question = Question.find(params[:question_id])
      @vote = @question.votes.new(params[:vote])
    end

    @vote.user_id = current_user.id

    if @vote.save
      redirect_to question_path(@question)
    else
      render questions_path
    end
  end

  def destroy
    if params.has_key?(:answer_id)
      @answer = Answer.find(params[:answer_id])
      @question = @answer.question.id
      @vote = @answer.votes.find_by(user_id: current_user.id)
      @vote.destroy
      redirect_to question_path(@question)
    else
      @question = Question.find(params[:question_id])
      @vote = @question.votes.find_by(user_id: current_user.id)
      @vote.destroy
      redirect_to question_path(@question)
    end
  end
end
