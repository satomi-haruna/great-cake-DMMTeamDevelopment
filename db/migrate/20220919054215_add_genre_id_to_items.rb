class AddGenreIdToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :genre_id, :integer
    change_column :items, :is_active, :boolean, default: true, null: false
  end
end
