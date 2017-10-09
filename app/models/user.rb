class User < ApplicationRecord
  include BCrypt

  has_many :tweets, foreign_key: :author_id

  # a user has many follows (follows many other users)
  has_many :followings, foreign_key: :from_user_id, class_name: "Following", table_name: "followings"
  has_many :follows, source: :to_user, through: :followings

  # a user has many followers (many other users follow them)
  has_many :followed, foreign_key: :to_user_id, class_name: "Following"
  has_many :followees, source: :from_user, through: :followed


  validates :username, :email, :password, presence: true
  validates :username, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def has_followee(other_user)
    self.followees.where(id: other_user.id).count > 0
  end

  def has_follower(other_user)
    self.followers.where(id: other_user.id).count > 0
  end

end
