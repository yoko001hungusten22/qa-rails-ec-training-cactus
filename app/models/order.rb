class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy

  def find_preparation_shipment_status
    order_details.any? {|order_detail| order_detail.shipment_status.shipment_status_name == '準備中'}
  end

  def all_products_total_price
    order_details.sum {_1.one_product_total_price}
  end
end
