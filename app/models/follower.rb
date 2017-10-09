class Follower < ApplicationRecord
  # Remember to create a migration!
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  belongs_to :followed, class_name: "User"
  belongs_to :follower, class_name: "User"
end
