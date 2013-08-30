class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    redirect_to action: 'index' if session[:user_id].nil?
    @question = Question.new
  end

  def create
   @question = Question.new(params[:question])
   puts params.inspect + "*"*800
   @question.tag_namez = params[:question][:tag_namez]
   puts @question.tag_namez
   @question.user_id = session[:user_id]
   if !session[:user_id].nil? && @question.save
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
    else
      @errors = @question.errors
      render 'edit'
    end
  end

end
