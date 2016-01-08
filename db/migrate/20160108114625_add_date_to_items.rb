class AddDateToItems < ActiveRecord::Migration
  def change
    add_column :items, :publication_date, :datetime
  end
end
