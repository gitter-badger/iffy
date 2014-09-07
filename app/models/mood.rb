class Mood
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :keywords, type: Array
  field :category, type: Array
  field :days, type: Array
  field :time_in, type: Integer
  field :time_out, type: Integer
  field :photo, type: String

  belongs_to :place

end
