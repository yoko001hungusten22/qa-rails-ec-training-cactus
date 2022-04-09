class User < ApplicationRecord
  belongs_to :user_classification
  has_many :orders, dependent: :destroy
end
