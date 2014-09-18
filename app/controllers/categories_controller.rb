class CategoriesController < ApplicationController
	def new
		@categories = Category.new
	end

	def create
		@category = Category.new(params.require(:category).permit(:name, :path, :total))
		if @category.save
			redirect_to category_path
		else
			render 'new'
		end
	end

	def index
		@categories = Category.all
	end
end
