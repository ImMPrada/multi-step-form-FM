class CreateAccountAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :account_admins do |t|
      t.references :account, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :account_admins, %i[account_id admin_id], unique: true
  end
end
