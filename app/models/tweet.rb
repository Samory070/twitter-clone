class Tweet < ApplicationRecord
  # Remember to create a migration!
  validates :content, presence: true
  validates :user_id, presence: true
end
