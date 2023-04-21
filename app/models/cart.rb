class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def aggregate_price
    cart_items.sum(&:sum_of_price)
  end
end
