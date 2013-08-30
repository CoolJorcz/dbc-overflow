class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params[:answer])
    @answer.user_id = session[:user_id]

    if @answer.save
      @question.answers << @answer
      if request.xhr?
          render json: @answer
      else
        redirect_to question_url(@question)
      end
    else
      @errors = @answer.errors
      render 'new'
    end
    
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to question_url(@question)
    else
      @errors = @answer.errors
      render 'edit'
    end
  end

end
