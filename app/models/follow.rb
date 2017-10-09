class Follow < ApplicationRecord
  # Remember to create a migration!
  validates :user_id1, presence: true
  validates :user_id2, presence: true

  belongs_to :user
  has_many :users
end
