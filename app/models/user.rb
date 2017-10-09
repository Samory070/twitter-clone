class User < ApplicationRecord
  # has_many :followers, through: :follower_follows, source: :follower
  # has_many :follower_follows, foreign_key: :followee_id, class_name: 'Follow'

  # has_many :followees, through: :followee_follows, source: :followee
  # has_many :followee_follows, foreign_key: :follower_id, class_name: 'Follow'
  has_many :tweets
  has_many :follows, foreign_key: :followee_id
  has_many :follows
   , foreign_key: :follower_id

  has_many :followings, through: :follows, source: :follower
  has_many :followees, through: :follows, source: :followee

  validates :email, uniqueness: true
  validates :fullname, :username, :email, :password, presence: true

  def self.authenticate(username, plaintext)
    user = User.find_by(params user:[:username])
    if user && user.password == params[:user][:password]
      user
    else
      return nil
    end
  end


  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
