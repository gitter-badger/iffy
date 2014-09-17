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
		
	end




	def show
		@mood = Mood.find(params[:id])
		@discover = true
		# @mood.selected += 1 # why doesn't this work?
	end
end
