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
    end
    redirect_to question_url(@question)
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    @answer.update_attributes(params[:answer])
    @answer.save
    redirect_to question_url(@question)
  end

end
