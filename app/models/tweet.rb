class Tweet < ApplicationRecord
  belongs_to :author, class_name: "User"

  validates :user_id, presence: true
  validates :content, presence: true
  validates :content, length: { maximum: 140 }
end
