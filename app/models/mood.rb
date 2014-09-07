class Mood
  include Mongoid::Document
  field :name, type: String
  field :keywords, type: Array
  field :category, type: Array
  field :days, type: Array
  field :time_in, type: Integer
  field :time_out, type: Integer

  belongs_to :place
end
