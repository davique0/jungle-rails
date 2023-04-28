class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :password, :password_confirmation, length: { minimum: 8 }, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

    def self.authenticate_with_credentials(email, password)
      user = User.find_by_email(email.strip.downcase)
        if user && user.authenticate(password)
            user
        else
            nil
        end
    ends
end
