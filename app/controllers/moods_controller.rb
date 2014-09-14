class MoodsController < ApplicationController
	def index
		@moods = Mood.all
	end
	def new
		@moods = Mood.new
	end
	def create
		@mood = Mood.new(params.require(:mood).permit(:name, :description, :photo, :category, :time_in, :time_out, :sort, :place))
		@mood.keywords = params[:mood][:keywords].split(",")
		@mood.days = params[:mood][:days]
		if @mood.save
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
		
		if @mood.update(params.require(:mood).permit(:name, :description, :photo, :time_in, :time_out, :sort, :place ))
			@mood.keywords = params[:mood][:keywords].tr("][", "").gsub(/["\\]/, '').split(", ")
			@mood.days = params[:mood][:days].tr("][", "").gsub(/["\\]/, '').split(", ")
			@mood.save
			redirect_to moods_path
		else
			render 'edit'
		end
	end
end



