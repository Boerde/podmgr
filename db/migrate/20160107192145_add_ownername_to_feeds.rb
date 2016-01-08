class AddOwnernameToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :owner_name, :string
  end
end
