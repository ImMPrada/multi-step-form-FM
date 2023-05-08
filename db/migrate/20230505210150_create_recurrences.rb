class CreateRecurrences < ActiveRecord::Migration[7.0]
  def change
    create_table :recurrences do |t|
      t.string :type, null: false, index: { unique: true }
      t.float :frecuence, null: false
      t.string :acronym, null: false

      t.timestamps
    end
  end
end
