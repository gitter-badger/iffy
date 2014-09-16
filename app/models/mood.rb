require 'yelp'

class Mood
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :keywords, type: Array
  field :category, type: String
  field :days, type: Array
  field :dayparts, type: Array
  field :photo, type: String
  field :sort, type: Integer
  field :selected, type: Integer

  # belongs_to :category

  def searchYelp(current_user)
  client = Yelp::Client.new({ consumer_key: "YlTjB3sl8gicTpB8Y1huVg",
                             consumer_secret: "xpsgTMujx-n8bitS2DPh126QrK4",
                             token: "6e0jiZvh2Y1iUZHwyO5FHwCXJi-jt8ln",
                             token_secret: "Frpqf4FrLRHTTrKiQvP9_XaLhcE"
                           })

  params = {
    category_filter: self.category,
    # limit: 1,
    radius_filter: current_user.radius,
    sort: self.sort,
    term: self.keywords
  }
  
  results = client.search(current_user.zip, params)

end
end

