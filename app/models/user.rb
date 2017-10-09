class User < ApplicationRecord
  validates :first_name, :last_name, :username, :email, :password_hash, presence: true
  validates :username, :email, uniqueness: true

  def password
    @password ||=BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, text_passoword)
    # Line 13, should be '=' or '==' ? My notes have it as one but
    # I think it should be two.
    return nil unless user = find_by(username: username)
    return user if user.password == text_passoword
    return nil
  end
end
