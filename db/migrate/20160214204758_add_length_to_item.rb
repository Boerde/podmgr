class AddLengthToItem < ActiveRecord::Migration
  def change
    add_column :items, :length_s, :int
  end
end
