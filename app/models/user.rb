class User < ApplicationRecord
  validates :first_name, { presence: true }
  validates :last_name, { presence: true }
  validates :username, { presence: true, uniqueness: true }
  validates :email, { presence: true }
  validates :password_hash, { presence: true }

  has_many :tweets

  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :follower_follows, source: :follower

  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followee_follows, source: :followee


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, new_password)
    user = User.find_by(username: username)
    if user && user.password == new_password
      return user
    else
      return nil
    end
  end

end
