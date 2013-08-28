module UserHelper
	def current_user
		@user ||= User.find(sessions[:user_id]) if session[:user_id]
	end
end