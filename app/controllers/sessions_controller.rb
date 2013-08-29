class SessionsController < ApplicationController
  include UserHelper

  def start
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect_to user_url(session[:user_id])
    else
      @user = User.new
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def delete
    session.clear
    redirect_to root_url
  end
end
