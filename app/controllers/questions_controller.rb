class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
   @question= Question.new(params[:question])
   @question.user_id = session[:user_id]
   if @question.save
      redirect_to "index"
   else
      @errors = @question.errors
      render 'new'
   end
  end

  def show
    @question = Question.find(params[:id])
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
