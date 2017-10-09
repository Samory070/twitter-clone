class Post < ApplicationRecord
  validates :tweet, :user_id, presence: true

  has_one :user, :through => :tweets
end
