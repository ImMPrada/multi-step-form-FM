class CreateAccountAddons < ActiveRecord::Migration[7.0]
  def change
    create_table :account_addons do |t|
      t.references :accounts, null: false, foreign_key: true
      t.references :addons, null: false, foreign_key: true

      t.timestamps
    end

    add_index :account_addons, %i[accounts_id addons_id], unique: true
  end
end
