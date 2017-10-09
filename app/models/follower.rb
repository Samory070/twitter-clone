class Follower < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"

  validates :from_user_id, uniqueness: true, :scope => :to_user_id



end
