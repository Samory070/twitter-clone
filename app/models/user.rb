class User < ApplicationRecord

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
