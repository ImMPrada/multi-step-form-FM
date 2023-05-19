class AddColumnToPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :icon_url, :string, null: false, default: ''
  end
end
