class MoodsController < ApplicationController
	def index
		@moods = Mood.all
	end
	def new
		@moods = Mood.new
	end
	def create
		@mood = Mood.new(params.require(:mood).permit(:name, :keywords, :category, :days, :time_in, :time_out, :place))
		if @mood.save
			redirect_to moods_path
		else
			render 'new'
		end
	end
end
