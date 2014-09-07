# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

places = Place.create([
	{ 
		name: 'Hinano', 
		address: '15 W Washington Blvd', 
		rating: '4.3', 
		rating_stars: 'http://s3-media4.fl.yelpcdn.com/assets/2/www/img/9f83790ff7f6/ico/stars/v1/stars_large_4_half.png', 
		url: 'http://www.yelp.com/biz/hinano-caf%C3%A9-venice-2', 
		tip: 'You should go here', 
		phone: '(310) 822-3902', 
		photo: 'http://s3-media3.fl.yelpcdn.com/bphoto/ZKlTc8VfDDWHEI-KPnl8Lg/o.jpg', 
		keywords: ['dive', 'locals', 'live music', 'hipster', 'burger', 'single'],
	},
	{
		name: 'Baja Cantina', 
		address: '200 W Washington Blvd', 
		rating: '4.3', 
		rating_stars: 'http://s3-media4.fl.yelpcdn.com/assets/2/www/img/9f83790ff7f6/ico/stars/v1/stars_large_4_half.png', 
		url: 'http://www.yelp.com/biz/hinano-caf%C3%A9-venice-2', 
		tip: 'This is a great place for brunch on Sundays', 
		phone: '(310) 822-3902', 
		photo: 'http://s3-media3.fl.yelpcdn.com/bphoto/ZKlTc8VfDDWHEI-KPnl8Lg/o.jpg', 
		keywords: ['brunch', 'margaritas', 'mexican' ],
	}
	])

moods = Mood.create([
	{ 
		name: 'Happy Hour with Co-Workers', 
		keywords: ['happy hour', 'bar'], 
		category: ['bars'], 
		days: [1,2,3,4,5], 
		time_in: '1600', 
		time_out: '1900',

		place: places[0],
	}, 
	{ 
		name: 'Brunch on the Beach', 
		keywords: ['brunch', 'beach'], 
		category: ['bars', 'restaurants'], 
		days: [6,7], 
		time_in: '900', 
		time_out: '1400',
		
		place: places[1],
	}
	])
