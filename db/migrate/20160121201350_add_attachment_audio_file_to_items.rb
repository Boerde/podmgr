class AddAttachmentAudioFileToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :audio_file
    end
  end

  def self.down
    remove_attachment :items, :audio_file
  end
end
