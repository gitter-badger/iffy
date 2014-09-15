require 'bcrypt'

class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :zip, type: Integer
  field :moods, type: Array
  field :places, type: Array
  field :access, type: String
  field :radius, type: Integer


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

end

