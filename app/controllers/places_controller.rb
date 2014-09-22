class PlacesController < ApplicationController

	def index
		@places = Place.all
	end

	def show
		@place = Place.find(params[:id])
	end

	def new
		@places = Place.new
	end

	def create
		@place = Place.new(params.require(:place).permit(:name, :address, :rating, :url, :tip, :phone, :photo))
		@place.keywords = params[:place][:keywords].split(",")
		if @place.save
			redirect_to places_path
		else
			render 'new'
		end
	end

	def edit
		@place = Place.find(params[:id])

	end

	def update
		@place = Place.find(params[:id])
		
		if @place.update(params.require(:place).permit(:name, :address, :rating, :url, :tip, :phone, :photo))
			@place.keywords = params[:place][:keywords].tr("][", "").gsub(/["\\]/, '').split(", ")
			@place.save
			redirect_to places_path
		else
			render 'edit'
		end
	end

	def destroy
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to places_path
	end

	def get_yelp
		require 'yelp'

			client = Yelp::Client.new({ consumer_key: "YlTjB3sl8gicTpB8Y1huVg",
			                            consumer_secret: "xpsgTMujx-n8bitS2DPh126QrK4",
			                            token: "6e0jiZvh2Y1iUZHwyO5FHwCXJi-jt8ln",
			                            token_secret: "Frpqf4FrLRHTTrKiQvP9_XaLhcE"
			                          })
			params = {
			  limit: 1,
			  sort: 1,
			  #radius_filter: 1610
			  term: 'brunch',
			  category_filter: 'bars'
			}

			result = client.search("Venice, CA", params).businesses[0]
	end

	def place_params
		params.require(:place).permit(:name, :address, :rating, :url, :tip, :phone, :photo, :keywords)
	end
end

