class CommentsController < ApplicationController

  def show
    answer = Answer.find(params[:answer_id])
    @comments = answer.comments.all
  end
end
