class AddAuthorToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :author, :string
  end
end
