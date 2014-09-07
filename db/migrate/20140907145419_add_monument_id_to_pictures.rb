class AddMonumentIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :monument_id, :integer
  end
end
