class AddSummaryToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :summary, :text
  end
end
