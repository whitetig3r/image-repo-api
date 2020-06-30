require 'validators/email_validator'

class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, length: { in: 6..15 }

  def password=(plaintext_pass)
    @password = plaintext_pass
    self.password_digest = BCrypt::Password.create(plaintext_pass)
  end

  def authenticate(plaintext_pass)
    if BCrypt::Password.new(self.password_digest) == plaintext_pass
      true
    end
  end

  def self.from_token_payload(payload)
    self.find payload['sub']
  end
end
