class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :link
      t.string :language
      t.string :copyright
      t.string :description
      t.string :logo

      t.timestamps null: false
    end
  end
end
