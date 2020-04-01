class CreateVitals < ActiveRecord::Migration[6.0]
  def change
    create_table :vitals do |t|
      t.string :category, null: false, default: ''
      t.string :measure, null: false, default: ''
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :vitals, :category
    add_index :vitals, :user_id
    add_foreign_key :vitals, :users, column: :user_id
  end
end
