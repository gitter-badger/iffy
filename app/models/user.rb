require 'bcrypt'
require 'gravatar-ultimate'

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Geocoder::Model::Mongoid
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :zip, type: Integer
  field :moods, type: Array
  field :places, type: Array
  field :access, default: 'user'
  field :radius, type: Integer
  field :bio
  #field :latitude, type: Float 
  #field :longitude, type: Float
  validates :email, presence: true, uniqueness: true 
  validates :password_digest, presence: true, :confirmation => true
  validates :zip, presence: true
  validates_numericality_of :zip, :in => 5
  # validates :password, presence: true
  



  scope :admin, -> { where(access: "admin")}
  # scope :user, where(access: "user")


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

