class AddColumnsToPaymentReferences < ActiveRecord::Migration[7.0]
  def change
    add_column :payment_recurrences, :years_delta, :float, null: false, default: 0
    add_column :payment_recurrences, :months_delta, :float, null: false, default: 0
    add_column :payment_recurrences, :days_delta, :float, null: false, default: 0
  end
end
