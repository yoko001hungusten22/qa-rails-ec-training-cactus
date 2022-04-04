class CreateUserClassifications < ActiveRecord::Migration[6.1]
  def change
    create_table :user_classifications do |t|
      t.string :user_classification_name, limit: 32

      t.timestamps
    end
  end
end
