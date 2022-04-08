class CreateProductStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :product_statuses do |t|
      t.string :product_status_name, limit: 32

      t.timestamps
    end
  end
end
