class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
	@user = User.new(params.require(:user).permit(:name, :email, :password, :zip, :radius))
	# doing this in the model now
	#@user.access ||= "user"
	if @user.save
		
		# log the user in
		redirect_to root_path
	else
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
		
		if @user.update_attributes(params.require(:user).permit(:name, :email, :places, :moods, :access, :radius, :zip))
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