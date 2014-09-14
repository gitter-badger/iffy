class Mood
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :keywords, type: Array
  field :category, type: String
  field :days, type: Array
  field :time_in, type: Time
  field :time_out, type: Time
  field :photo, type: String
  field :sort, type: Integer

  belongs_to :place

end
