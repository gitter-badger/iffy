class SearchesController < ApplicationController
	def index
		@searches = Search.all
	end

	def new
		@searches = Search.new
	end

	def create
		@search = Search.new(params.require(:search).permit(:limit, :sort, :term, :category_filter, :location, :radius_filter))
		if @search.save
			redirect_to searches_path
		else
			render 'new'
		end
	end

	def show
		@search = Search.find(params[:id])
	end

	def edit
		@search = Search.find(params[:id])

	end

	def update
		@search = Search.new(params.require(:search).permit(:limit, :sort, :term, :category_filter, :location, :radius_filter))
		if @search.save
			redirect_to searches_path
		else
			render 'edit'
		end
	end



end