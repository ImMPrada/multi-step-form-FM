class AddReferenceToAccount < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :plan, null: false, foreign_key: true
  end
end
