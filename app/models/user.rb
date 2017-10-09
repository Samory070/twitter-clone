class User < ApplicationRecord
  # Remember to create a migration!
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :tweets
  belongs_to :user
  has_many :users

  has_secure_password
end
