class SessionsController < ApplicationController

	def new
		flash.clear
	end

	def create
	flash.clear
		# STEP ONE - Retrieve a User record by the email parameter
		begin
		user = User.find_by({email: params[:session][:email]})
		rescue
			flash[:error] = 'Invalid credentials.'			
		end
		# STEP TWO - If the user exists, use the User.authenticate 
		#            method to ensure the password is correct
		if user && user.authenticate(params[:session][:password])
			log_in(user)
			# flash[:error] = 'Logged in'
			current_location = user.zip

		# STEP THREE - If authenticated successfully, redirect to root_path
		redirect_to root_path
	else
		flash[:error] ||= 'Invalid credentials.'
		render 'new'
		end
	end

	def destroy
		log_out
		redirect_to sessions_path
	end
end
