class SessionsController < ApplicationController

	def new
	end

	def create
	flash[:error] = nil
		# STEP ONE - Retrieve a User record by the email parameter
		begin
		user = User.find_by({email: params[:session][:email]})
		rescue
			flash[:error] = 'Email not found.'			
		end
		# STEP TWO - If the user exists, use the User.authenticate 
		#            method to ensure the password is correct
		if user && user.authenticate(params[:session][:password])
			log_in(user)
			flash[:error] = 'Logged In!'

		# STEP THREE - If authenticated successfully, redirect to root_path
		redirect_to root_path
	else
		flash[:error] ||= 'Try again.'
		render 'new'
		end
	end

	def destroy
		log_out
		redirect_to sessions_path
	end
end
