require 'bcrypt'
require 'gravatar-ultimate'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Geocoder::Model::Mongoid

  attr_accessor :yelp_results
  geocoded_by :address

  # This validation line is causing problems with user creation
  #after_validation :geocode, :if => :address_changed?
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :zip, type: Integer
  field :address
  field :places, type: Array
  field :access, default: 'user'
  field :radius, type: Integer
  field :bio
  field :latitude, type: Float, default: '0'
  field :longitude, type: Float, default: '0'
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true 
  validates :password_digest, presence: true, :confirmation => true
  validates_numericality_of :zip, :in => 5
  validates :zip, presence: true

  validates_each :zip do |record, attr, value|
    #add a begin/rescue here
    if value
      if value.to_s.to_region(:state => true) != "CA"
        record.errors.add attr, "Sorry, Iffy isn\'t in your area yet!" 
      end
    end
  end

  

# this creates @users.admin to grab all admins
  scope :admin, -> { where(access: "admin")}


  def password=(new_password)
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if test_password && BCrypt::Password.new(self.password_digest) == test_password
      self
    else
      false
    end
  end

  def gravatar(user_email)
    url = Gravatar.new(user_email).image_url
  end


end

