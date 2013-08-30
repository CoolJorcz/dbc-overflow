class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(params[:answer])
    @answer.user_id = session[:user_id]

    # if request.xhr?      
    #   if @answer.save
    #     content_type :json
    #     {answer: @answer.answer_text}.to_json
    #   else
    #     @errors = @answer.errors
    #     render 'new'
    #   end
    # end
      # respond_to do |format|
    #   if @answer.save
    #     format.html { redirect_to question_url(@question), notice: "Answer was saved successfully!"}
    #     format.js {}
    #     format.json {render html}
    #   else
    #     format.html { render action: 'new'}
    #   end
    # end    

    if @answer.save
      if request.xhr?
        @question.answers << @answer
          render partial: '/answers/answer', layout: false, locals: {question: @question}
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
