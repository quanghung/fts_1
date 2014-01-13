class Admin < ActiveRecord::Base
	  has_secure_password
  attr_accessor :not_validates_password
  validates :password, length: { minimum: 6 }, unless: :not_validates_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end

end
