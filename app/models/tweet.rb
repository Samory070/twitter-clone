class Tweet < ApplicationRecord
  belongs_to :user

  validates :body, :user, presence: true

end
