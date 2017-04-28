class QuestionsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    question = Question.new(question_params)
    if question.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :description).merge(user_id: current_user.id)
    end
end
