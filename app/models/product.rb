class Product < ApplicationRecord
  belongs_to :category
  belongs_to :sale_status
  belongs_to :product_status
  belongs_to :user
  has_many :purchases, dependent: :destroy
  has_many :order_details, dependent: :nullify

  enum category: { 寝具: 1, 時計: 2, 食品: 3, 文具: 4 }

  #商品名による絞り込み
  scope :get_by_name, ->(product_name) {
  where('product_name LIKE ?', "%#{product_name}%")
  }
  
  #カテゴリーによる絞り込み
  scope :get_by_category, ->(category) {
  where(category: category)
  }
end
