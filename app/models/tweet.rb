class Tweet < ApplicationRecord
  validates :post, :user, presence: true

  belongs_to :user
end
