class CreateAccount < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :activated, null: false, default: false
      t.references :owner, references: :users, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
