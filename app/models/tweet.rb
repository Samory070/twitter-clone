class Tweet < ApplicationRecord
  belongs_to :user
  validates :post, :user_id, presence: true
end
