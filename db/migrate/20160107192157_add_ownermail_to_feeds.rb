class AddOwnermailToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :owner_mail, :string
  end
end
