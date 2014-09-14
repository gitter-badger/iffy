require 'yelp'

class Search
  include Mongoid::Document
  field :limit, type: Integer
  field :sort, type: Integer
  field :term, type: String
  field :category_filter, type: String
  field :location, type: String
  field :radius_filter, type: Integer


  def searchYelp
  client = Yelp::Client.new({ consumer_key: "YlTjB3sl8gicTpB8Y1huVg",
                             consumer_secret: "xpsgTMujx-n8bitS2DPh126QrK4",
                             token: "6e0jiZvh2Y1iUZHwyO5FHwCXJi-jt8ln",
                             token_secret: "Frpqf4FrLRHTTrKiQvP9_XaLhcE"
                           })

  params = {
  limit: self.limit,
  sort: self.sort,
  term: self.term,
  category_filter: self.category_filter,
  radius_filter: self.radius_filter
}
  num_results = client.search(self.location, params).businesses.length
  result = client.search(self.location, params)

  end
end
