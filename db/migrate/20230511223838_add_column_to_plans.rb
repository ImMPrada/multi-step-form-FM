class AddColumnToPlans < ActiveRecord::Migration[7.0]
  def change
    add_column :plans, :icon_path, :string, null: false, default: ''
  end
end
