class AddFtpRootUrlToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :ftp_root_url, :string
  end
end
