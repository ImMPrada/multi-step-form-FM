class AddPlanReferenceToAccount < ActiveRecord::Migration[7.0]
  def change
    add_reference :accounts, :plan, foreign_key: true
  end
end
