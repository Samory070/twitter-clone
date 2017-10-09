class Tweet < ApplicationRecord
  # Remember to create a migration!
  belongs_to :user

  validates :tweet_text, :user, presence: true
end
