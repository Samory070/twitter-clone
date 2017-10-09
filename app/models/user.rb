class User < ApplicationRecord
  # Remember to create a migration!
    include BCrypt

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :tweets
  has_many :followers, foreign_key: "follower_id"
  has_many :followed_users, through: :followers, source: :followed

#creating a user password
    def password
    @password ||= Password.new(password_hash)
  end

#creating the password hash
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

#authenticating a user
  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return nil unless user

    if user.password == password
      return user
    else
      return nil
    end
  end

end
