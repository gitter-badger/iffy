class SessionsController < ApplicationController

	def new
		flash.clear
	end

	def create
	flash.clear
		begin
		user = User.find_by({email: params[:session][:email]})
		rescue
			flash[:error] = 'Invalid credentials.'	
		end
		if user && user.authenticate(params[:session][:password])
			log_in(user)
			# flash[:error] = 'Logged in'
			current_location = user.zip
		redirect_to root_path
	else
		flash[:error] ||= 'Invalid credentials.'
		#render 'new'
		redirect_to root_path
		end
	end

	def destroy
		log_out
		redirect_to sessions_path
	end
end
