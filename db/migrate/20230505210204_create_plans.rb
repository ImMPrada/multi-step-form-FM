class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :status, null: false
      t.string :note

      t.references :payment_recurrence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
