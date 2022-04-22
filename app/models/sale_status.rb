class SaleStatus < ApplicationRecord
  has_many :products, dependent: :destroy
end
