class User < ApplicationRecord
  has_many :tweets , foreign_key: :user_id

  validates :hashed_password,:email, presence:true
  validates :email, uniqueness:true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email,user_password)
    return nil unless user = find_by(email: email)
    return user if user.password == user_password
    return nil
  end

end
