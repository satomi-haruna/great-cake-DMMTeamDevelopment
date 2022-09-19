class RemoveIsActiveFromItem < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :is_active, :boolean
    add_column :items, :is_active, :boolean, default: false, null: false
  end
end
