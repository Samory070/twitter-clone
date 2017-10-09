class User < ApplicationRecord
  # Remember to create a migration!
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :tweets
  has_many :followers, foreign_key: "follower_id"
  has_many :followed_users, through: :followers, source: :followed
end
