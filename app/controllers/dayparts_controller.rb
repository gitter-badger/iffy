class DaypartsController < ApplicationController
	def index
		@dayparts = Daypart.all
	end

	def new
		@daypart = Daypart.new
	end

	def show
		@daypart = Daypart.find(params[:id])
	end

	def edit
		@daypart = Daypart.find(params[:id])
	end

	def update
		@daypart = Daypart.find(params[:id])
		
		if @daypart.update(params.require(:daypart).permit(:name, :photo, :times => []))
			#@mood.dayparts = params[:mood][:dayparts].split(",")
			@daypart.save
			redirect_to dayparts_path
		else
			render 'edit'
		end
	end
end
