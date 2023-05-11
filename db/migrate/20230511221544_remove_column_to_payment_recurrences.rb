class RemoveColumnToPaymentRecurrences < ActiveRecord::Migration[7.0]
  def change
    remove_column :payment_recurrences, :frecuence
  end
end
