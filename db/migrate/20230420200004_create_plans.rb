class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name, null: false, unique: true
      t.string :frequence, null: false
      t.float :price, null: false

      t.timestamps
    end

    add_index :plans, :name, unique: true
  end
end
