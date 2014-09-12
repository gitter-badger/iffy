class Category
  include Mongoid::Document
  field :name, type: String
  field :path, type: String
end
