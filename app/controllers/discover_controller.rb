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
			@daypart = 'early morning'
		when 8..9
			@daypart = 'morning'
		when 10
			@daypart = 'late morning'
		when 11..12
			@daypart = 'midday'
		when 13..15
			@daypart = 'early afternoon'
		when 16..17
			@daypart = 'late afternoon'
		when 18..19
			@daypart = 'early evening'
		when 20..21
			@daypart = 'night'
		when 22..23
			@daypart = 'late night'
		when 1..2
			@daypart = 'overnight'
		else
			@daypart = 'sleepytime'
		end
	end
end
