class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :nick
      t.string :email, null: false, index: { unique: true }
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end