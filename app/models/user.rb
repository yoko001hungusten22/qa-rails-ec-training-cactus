class User < ApplicationRecord
  belongs_to :user_classification
  has_many :orders, dependent: :destroy

  validates :last_name, presence: true, length: { maximum: 10 }
  validates :first_name, presence: true, length: { maximum: 10 }
  validates :password, presence: true, confirmation: true , format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { in: 6..15 }
  validates :zipcode, presence: true, format: { with: /\A[0-9]+\z/ }, length: { is: 7 }
  validates :prefecture, presence: true, length: { maximum: 5 }
  validates :municipality, presence: true, length: { maximum: 10 }
  validates :address, presence: true, length: { maximum: 15 }
  validates :apartments, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
  validates :phone_number, presence: true, format: { with: /\A[0-9]+\z/ }, length: { minimum: 15 }

end