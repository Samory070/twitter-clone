class Tweet < ApplicationRecord
  validates :subject, :content, :username, presence: true
end
