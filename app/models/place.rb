class Place
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :rating, type: Float
  field :url, type: String
  field :tip, type: String
  field :phone, type: String
  field :photo, type: String
  field :keywords, type: String
end
