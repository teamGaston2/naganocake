class RemoveItemIdFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :item_id, :integer
  end
end
