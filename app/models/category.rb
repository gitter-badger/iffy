class Category
  include Mongoid::Document
  field :name, type: String
  field :path, type: String
  field :total, type: String

  # has_many: moods
end
