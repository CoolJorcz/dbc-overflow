class SessionsController < ApplicationController
  include UserHelper

  def start
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      current_user = @user
      redirect_to user_url(current_user)
    else
      redirect_to new_session_url(@user)
    end
  end

  def new
    @user = User.new
  end

  def clear
    session.clear
    redirect_to root_url
  end
end