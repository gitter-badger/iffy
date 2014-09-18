class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
	@user = User.new(params.require(:user).permit(:name, :email, :password, :zip, :radius, :bio, :coordinates ))


	if @user.save	
		# log the user in
		redirect_to root_path
	else
		flash[:error] = 'Please complete all fields to create an account'
		render 'new'
	end
  end


    def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

  def edit
	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
		
		if @user.update_attributes(params.require(:user).permit(:name, :email, :places, :access, :radius, :zip, :bio, :coordinates))
			redirect_to users_path
		else
			render 'edit'
		end
  end

  def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
  end


end