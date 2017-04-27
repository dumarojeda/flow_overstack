class QuestionsController < ApplicationController
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
    @question = Question.new(question_params)
    
  end

  private
    def question_params
      params.require(:question).permit(:title, :description)
    end
end
