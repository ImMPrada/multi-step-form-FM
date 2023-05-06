class CreateAddons < ActiveRecord::Migration[7.0]
  def change
    create_table :addons do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :status, null: false
      t.string :note

      t.references :recurrence, null: false, foreign_key: true

      t.timestamps
    end
  end
end
