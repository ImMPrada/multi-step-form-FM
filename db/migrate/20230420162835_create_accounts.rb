class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :email, null: false, unique: true
      t.string :name, null: false
      t.string :phone, null: false

      t.timestamps
    end

    add_index :accounts, :email, unique: true
  end
end
