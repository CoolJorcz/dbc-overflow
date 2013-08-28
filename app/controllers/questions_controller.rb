class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
   @question = Question.new(params[:question])

   if @question.save
      render 'index'
   else
      @errors = @question.errors
      render 'new'
   end
  end

  def show
    @question = Question.find(params[:id])
    @answers = []
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(params[:question])
      redirect_to action: 'index'
      # redirect_to question_url(@question)
    else
      @errors = @question.errors
      render 'edit'
    end
  end

end
