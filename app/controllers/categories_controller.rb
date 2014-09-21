class CategoriesController < ApplicationController
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
	@category = Category.new(params.require(:category).permit(:name, :path, :total, :icon, :mood_ids))
		if @category.save
			redirect_to categories_path
		else
			render 'new'
		end
	end

	

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
				
		if @category.update_attributes(params.require(:category).permit(:name, :path, :total, :icon, :mood_ids))
			redirect_to categories_path
		else
			render 'edit'
		end
	end

end
