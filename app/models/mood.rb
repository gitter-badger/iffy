class Mood
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :keywords, type: String
  field :category, type: String
  field :days, type: String
  field :time_in, type: Integer
  field :time_out, type: Integer
  field :photo, type: String
  field :sort, type: Integer

  belongs_to :place

end
