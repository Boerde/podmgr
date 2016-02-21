class RemoveImagePathFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :image_path, :string
  end
end
