class User < ActiveRecord::Base
  include BCrypt

  validates :full_name, :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  has_many :tweets
  has_many :follows

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
