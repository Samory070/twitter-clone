class Tweet < ApplicationRecord
  belongs_to :User
  validates :hashed_password,:email, presence:true
end
