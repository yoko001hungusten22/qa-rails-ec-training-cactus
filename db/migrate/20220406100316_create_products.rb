class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :product_name, limit: 64
      t.refereences :categories, foreign_key:  true
      t.integer :price
      t.string :description, limit: 256
      t.string :sale_status_id,
      t.string :product_status_id,
      t.string :regist_date, timestamps
      t.refereences :users, foreign_key:  true
      t.boolean :delete_flg, limit: 1
      
      t.timestamps
    end
  end
end
