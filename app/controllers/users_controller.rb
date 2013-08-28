class UsersController < ApplicationController

	include UserHelper

	def create
		user = User.create(params[:user])

		unless user.id.nil?
			current_user = session[user.id]
			redirect_to user_url(user)
		else
			redirect_to new_user_url
		end
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
		@current
	end

	def update
		user = User.find(params[:id])
		if user.update_attributes(username: params[:user][:username]) && user.save
			redirect_to user_url
		else
			redirect_to edit_user_url(user)
		end
	end

end