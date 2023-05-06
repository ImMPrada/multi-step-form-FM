class CreateSuscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :suscriptions do |t|
      t.string :accepted, null: false, default: 'false'
      t.string :status, null: false, default: 'false'
      t.datetime :limit_date
      t.datetime :start_date
      t.datetime :end_date

      t.references :accounts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
