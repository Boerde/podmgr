class RemoveLogoFromFeed < ActiveRecord::Migration
  def change
    remove_column :feeds, :logo, :string
  end
end
