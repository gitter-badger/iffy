class Category
  include Mongoid::Document
  field :name, type: String
  field :path, type: String
  field :total, type: String
end
