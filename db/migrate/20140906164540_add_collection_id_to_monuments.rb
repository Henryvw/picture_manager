class AddCollectionIdToMonuments < ActiveRecord::Migration
  def change
    add_column :monuments, :collection_id, :integer
  end
end
