class MoodsController < ApplicationController
	def index
		@moods = Mood.all
	end
	def new
		@mood = Mood.new
	end
	def create
		@mood = Mood.new(params.require(:mood).permit(:name, :description, :photo, :category_id, :sort, :selected, :daypart_ids => [], :user_ids => []))
		# can we do ':keywords => []' here instead?
		@mood.keywords = params[:mood][:keywords].split(", ")
		@mood.days = params[:mood][:days]
		#@mood.save
		#@mood.dayparts = params[:mood][:dayparts].split(",")
		# @mood.category.total += 1
		# @mood.photo ||= "http://static.tumblr.com/4doxknm/O4sm6v0y7/lame.gif"

		if @mood.save
			#moods_path goes to main moods directory
			# may need to change this to moods_path
			redirect_to moods_path
		else
			render 'new'
		end
	end
	
	def show
		@mood = Mood.find(params[:id])
	end

	def destroy
		@mood = Mood.find(params[:id])
		@mood.destroy
		redirect_to moods_path
	end
	def edit
		@mood = Mood.find(params[:id])
	end

	def update
		@mood = Mood.find(params[:id])
		
		if @mood.update(params.require(:mood).permit(:name, :description, :photo, :sort, :category_id, :selected, :daypart_ids => [], :user_ids => []))
			@mood.keywords = params[:mood][:keywords].tr("][", "").split(",")
			@mood.days = params[:mood][:days]
			#@mood.dayparts = params[:mood][:dayparts].split(",")
			@mood.save
			redirect_to moods_path
		else
			render 'edit'
		end
	end
end
