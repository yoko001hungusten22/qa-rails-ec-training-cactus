class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.timestamp :order_date
      t.string :order_number, limit: 16

      t.timestamps
    end
  end
end
