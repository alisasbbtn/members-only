require 'digest'

class User < ApplicationRecord
  before_save :downcase_email
  before_create :create_remember_token

  validates :name, presence: true, length: { maximum: 32 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :posts

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
  end

  private

    def downcase_email
      self.email.downcase!
    end

    def create_remember_token
      self.remember_token = User.new_token
    end
end
