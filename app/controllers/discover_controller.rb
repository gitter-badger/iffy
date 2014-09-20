class DiscoverController < ApplicationController
	def index
		@time = Time.now
		@pretty_time = Time.now.strftime('%l:%M%P')
		@hour = @time.hour
		@minute = @time.min
		@day = @time.strftime('%A')
		@abbr_day = @time.strftime('%a')
		@moods = Mood.all

		
		case @hour
		when 5..7
			@daypart = Daypart.find_by(name: 'early morning')
		when 8..9
			@daypart = Daypart.find_by(name: 'morning')
		when 10
			@daypart = Daypart.find_by(name: 'late morning')
		when 11..12
			@daypart = Daypart.find_by(name: 'midday')
		when 13..15
			@daypart = Daypart.find_by(name: 'early afternoon')
		when 16..17
			@daypart = Daypart.find_by(name: 'late afternoon')
		when 18..19
			@daypart = Daypart.find_by(name: 'early evening')
		when 20..21
			@daypart = Daypart.find_by(name: 'night')
		when 22..23
			@daypart = Daypart.find_by(name: 'late night')
		when 1..2
			@daypart = Daypart.find_by(name: 'overnight')
		else
			@daypart = Daypart.find_by(name: 'sleepytime')
		end

		@home = true

		# started trying to detect if coordinates are located
		if logged_in?
			current_user.latitude = request.location.latitude
			current_user.longitude = request.location.longitude	
			current_user.save
		end
		
	end


	def show
		@mood = Mood.find(params[:id])
		@discover = true
		# why doesn't this work?
		current_user.moods << @mood
		# it doesn't like this next line
		current_user.save

		# Need to find out how to push these to the user model
		#@user.places << @mood.searchYelp(current_user).businesses[0].id
		#@user.moods = Mood.find(params[:id])

	end

	def share
		require 'twilio-ruby'

		account_sid = 'AC9534c890191157016b5de8ae93b656d8'
		auth_token = 'd0a7fe1196c58e3fbb8b2844d74b5582'

		# set up a client to talk to the Twilio REST API
		@client = Twilio::REST::Client.new account_sid, auth_token

		# learn how to pass variables into to "to", "body", and "url" 
		flash[:error] = 'Successfully shared!'
		pars = {
			:from => '+13237451232', :to => '3474012203', :body => 'this place'
		}
		@client.messages.create(pars) 
		redirect_to discover_path(params[:id])

	end

	def traveling
		if params[:nearby]
			current_user.traveling = true
		else
			current_user.traveling = false
		end

		current_user.save
		redirect_to root_path
	end

end
