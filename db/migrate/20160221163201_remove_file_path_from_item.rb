class RemoveFilePathFromItem < ActiveRecord::Migration
  def change
    remove_column :items, :file_path, :string
  end
end
