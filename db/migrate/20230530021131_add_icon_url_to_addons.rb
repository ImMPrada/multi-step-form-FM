class AddIconUrlToAddons < ActiveRecord::Migration[7.0]
  def change
    add_column :addons, :icon_url, :string, null: false, default: ''
  end
end
