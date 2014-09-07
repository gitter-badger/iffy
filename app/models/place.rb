class Place
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :rating, type: Float
  field :rating_stars, type: String
  field :url, type: String
  field :tip, type: String
  field :phone, type: String
  field :photo, type: String
  field :keywords, type: Array

  has_many :moods
end
