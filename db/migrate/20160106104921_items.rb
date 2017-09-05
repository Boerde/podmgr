class Items < ActiveRecord::Migration
  def change
    change_column :items, :summary, :text
  end
end
