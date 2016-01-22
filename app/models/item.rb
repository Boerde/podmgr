class Item < ActiveRecord::Base
    belongs_to :feed
    has_attached_file :audio_file
    validates_attachment :audio_file, content_type: {content_type: "audio/mpeg" }
end
