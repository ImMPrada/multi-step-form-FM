class CreatePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :plans do |t|
      t.string :name, null: false
      t.integer :frequence_number, null: false
      t.string :frequence_unit, null: false
      t.float :price, null: false
      t.text :note, default: true
      t.boolean :active, null: false, default: true
      

      t.timestamps
    end

    add_index :plans, [:name, :frequence_number, :frequence_unit], unique: true
  end
end
