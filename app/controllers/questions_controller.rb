class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def show
    # @Vote_allow enables user to vote once
    if user_signed_in?
      @vote_allow = @question.votes.where(user_id: current_user.id).size > 0
    end
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path
    else
      @errors = @question.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @question.destroy

    redirect_to questions_path
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path
    else
      @errors = @question.errors.full_messages
      render 'edit'
    end
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :description).merge(user_id: current_user.id)
    end
end
