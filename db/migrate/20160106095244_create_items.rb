class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :series
      t.string :speaker
      t.string :summary
      t.string :file_path

      t.timestamps null: false
    end
  end
end
