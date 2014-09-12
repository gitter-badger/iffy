class MoodsController < ApplicationController
	def index
		@moods = Mood.all
	end
	def new
		@moods = Mood.new
	end
	def create
		@mood = Mood.new(params.require(:mood).permit(:name, :description, :photo, :keywords, :category, :days, :time_in, :time_out, :sort, :place))
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
		@mood.keywords = params[:mood][:keywords].tr("][", "").split(", ")

		if @mood.update_attributes(params.require(:mood).permit(:name, :description, :keywords, :category, :days, :time_in, :time_out, :photo, :sort))
			redirect_to moods_path
		else
			render 'edit'
		end
	end
end
