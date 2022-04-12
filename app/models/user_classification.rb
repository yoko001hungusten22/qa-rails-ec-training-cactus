class UserClassification < ApplicationRecord
  has_many :users, dependent: :destroy
end
