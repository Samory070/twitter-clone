class Tweet < ApplicationRecord
  belongs_to :user
  validates :message, :user_id
end
