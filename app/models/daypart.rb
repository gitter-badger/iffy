class Daypart
  include Mongoid::Document
  field :name, type: String
  field :path, type: String
  field :times, type: Range
end