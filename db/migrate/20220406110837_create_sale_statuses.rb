class CreateSaleStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :sale_statuses do |t|
      t.string :sale_status_name, limit: 32

      t.timestamps
    end
  end
end
