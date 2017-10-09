class User < ApplicationRecord
  has_many :followers, through: :follower_follows, source: :follower
  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"

  has_many :followees, through: :followee_follows, source: :followee
  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"

  has_many :tweets

  validates :full_name, :username, :email, :hash_password, presence: true
  validates :email, :username, uniqueness: true

  def password
    @password ||= BCrypt::Password.new(hash_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hash_password = @password
  end

  def self.authenticate(email, plaintext_password)
    return nil unless user = find_by(email: email)
    return user if user.password == plaintext_password
    return nil
end
