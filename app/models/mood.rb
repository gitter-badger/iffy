require 'yelp'

class Mood
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :description, type: String
  field :keywords, type: Array
  field :category, type: String
  field :days, type: Array
  field :photo, type: String
  field :sort, type: Integer
  field :selected, type: Integer

  has_and_belongs_to_many :dayparts
  has_and_belongs_to_many :users
  # has_and_belongs_to_many :categories

  attr_accessor :yelp_results

  def searchYelp(current_user)
  params = {
    category_filter: self.category,
    # limit: 1,
    # radius_filter: current_user.radius,
    sort: self.sort,
    term: self.keywords.join('+')
  }
  
  @yelp_results ||= Yelp.client.search(current_user.zip, params)

  end
end

