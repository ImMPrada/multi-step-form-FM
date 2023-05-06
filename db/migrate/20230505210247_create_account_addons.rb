class CreateAccountAddons < ActiveRecord::Migration[7.0]
  def change
    create_table :account_addons do |t|
      t.references :account, null: false, foreign_key: true
      t.references :addon, null: false, foreign_key: true

      t.timestamps
    end

    add_index :account_addons, %i[account_id addon_id], unique: true
  end
end
