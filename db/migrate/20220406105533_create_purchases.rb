class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :purchase_price
      t.integer :purchase_quantity
      t.string :purchase_company, limit: 128
      t.string :order_date, timestamps
      t.string :purchase_date, timestamps
      t.string :product_id

      t.timestamps
    end
  end
end
