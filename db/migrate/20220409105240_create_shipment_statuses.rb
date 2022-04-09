class CreateShipmentStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipment_statuses do |t|
      t.string :shipment_status_name, limit: 32

      t.timestamps
    end
  end
end
