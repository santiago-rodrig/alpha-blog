class User < ApplicationRecord
  before_save { self.email.downcase! }

  has_many :articles, dependent: :destroy

  validates(
    :name,
    uniqueness: { case_sensitive: false },
    presence: true,
    length: { minimum: 3, maximum: 25 },
  )

  validates(
    :email,
    uniqueness: { case_sensitive: false },
    presence: true,
    length: { maximum: 105 },

    format: {
      with: URI::MailTo::EMAIL_REGEXP,
      message: 'format is invalid'
    }
  )

  has_secure_password
end
