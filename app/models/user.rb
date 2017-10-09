class User < ApplicationRecord
  belongs_to :followers , class_name: "Follower"
  has_many :followers
  has_many :followings, class_name: "Follower", foreign_key: "follower_id"
  has_many :followings, through: :followings, source: :User


  validates :hashed_password,:email, presence:true
  validates :email, uniqueness:true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email,user_password)
    return nil unless user = find_by(email: email)
    return user if user.password == user_password
    return nil
  end

end
