class Follow < ApplicationRecord
  # Remember to create a migration!
  validates :user_id1, presence: true
  validates :user_id2, presence: true

  belongs_to :user
  belongs_to :user
end
