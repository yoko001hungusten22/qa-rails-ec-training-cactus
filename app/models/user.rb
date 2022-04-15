class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /^[0-9a-zA-Z]*$/
  VALID_ZIPCODE_REGEX = /\A[0-9]+\z/
  VALID_PHONE_NUMBER_REGEX = /\A[0-9]+\z/

  belongs_to :user_classification
  has_many :orders, dependent: :destroy

  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  has_secure_password
  validates :password, presence: true, confirmation: true , format: { with: VALID_PASSWORD_REGEX }, length: { in: 6..15 }
  validates :zipcode, presence: true, format: { with: VALID_ZIPCODE_REGEX }, length: { is: 7 }
  validates :prefecture, presence: true, length: { maximum: 5 }
  validates :municipality, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 15 }
  validates :apartments, length: { maximum: 20 }
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }, length: { maximum: 15 }

end