class Daypart
  include Mongoid::Document
  field :name, type: String
  field :times, type: Range
  field :photo, type: String
  
  has_and_belongs_to_many :moods
end
