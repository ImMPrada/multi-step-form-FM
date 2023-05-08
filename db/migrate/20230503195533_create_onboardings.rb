class CreateOnboardings < ActiveRecord::Migration[7.0]
  def change
    create_table :onboardings do |t|
      t.string :token, null: false, index: { unique: true }
      t.string :status, null: false, default: 'pending'
      t.integer :current_step, null: false, default: 2

      t.references :account, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
