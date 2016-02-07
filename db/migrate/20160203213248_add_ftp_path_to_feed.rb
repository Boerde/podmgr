class AddFtpPathToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :ftp_path, :string
  end
end
