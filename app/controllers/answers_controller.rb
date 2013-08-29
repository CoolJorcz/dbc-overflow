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

end
