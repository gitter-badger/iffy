require 'yelp'

class Mood
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug
  field :name, type: String
  field :description, type: String
  field :keywords, type: Array, default: []
  field :days, type: Array, default: []
  field :photo, type: String
  field :sort, type: Integer
  field :selected, type: Integer
  slug :name
  validates :name, presence: true, uniqueness: true 

  field :category
  has_and_belongs_to_many :dayparts
  #has_and_belongs_to_many :users
  #has_and_belongs_to_many :places
  #has_and_belongs_to_many :categories


  def searchYelp(current_user)
  params = {
    category_filter: self.category,
    # limit: 1,
    radius_filter: current_user.radius,
    sort: self.sort,
    term: self.keywords.join('+')
  }

  
  coordinates = {
    latitude: current_user.zip.to_s.to_lat,
    longitude: current_user.zip.to_s.to_lon
  }
  
  @yelp_results ||= Yelp.client.search_by_coordinates(coordinates, params)



  end
end

