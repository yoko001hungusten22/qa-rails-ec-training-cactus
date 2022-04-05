class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :password, limit: 64
      t.string :last_name, limit: 16
      t.string :first_name, limit: 16
      t.string :zipcode, limit: 16
      t.string :prefecture, limit: 16
      t.string :municipality, limit: 16
      t.string :address, limit: 32
      t.string :apartments, limit: 32
      t.string :email, limit: 128
      t.string :phone_number, limit: 16
      t.references :user_classification, foreign_key: true
      t.string :company_name, limit: 128
      t.boolean :delete_flg

      t.timestamps
    end
  end
end
