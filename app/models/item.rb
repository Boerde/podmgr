class Item < ActiveRecord::Base
    require "mp3info"
    belongs_to :feed

    has_attached_file :audio_file, {
        :storage => :ftp,
        :path => ":pc_ftp_pth/:filename",
        :url => "ftp://:pc_ftp_url/:filename",
        :ftp_servers => [
            {
                :host => YAML.load_file(Rails.root.join('config', 'ftp_config.yml'))[Rails.env]['ftp_host'],
                :user => YAML.load_file(Rails.root.join('config', 'ftp_config.yml'))[Rails.env]['ftp_user'],
                :password => YAML.load_file(Rails.root.join('config', 'ftp_config.yml'))[Rails.env]['ftp_password']
            }
        ],
        :ftp_connect_timeout => 5,
        :ftp_ignore_failing_connections => true,
        :ftp_keep_empty_directories => true
    }

    before_save :write_info_to_audio_file

    Paperclip.interpolates :pc_ftp_pth do |attachment, style|
        attachment.instance.feed.ftp_path
    end

    Paperclip.interpolates :pc_ftp_url do |attachment, style|
        attachment.instance.feed.ftp_root_url
    end

    Paperclip.interpolates :pc_ftp_host do |attachment, style|
        attachment.instance.feed.ftp_host
    end

    def write_info_to_audio_file
        #no new file to upload -> skip
        if audio_file.queued_for_write[:original] == nil
            return
        end
        Mp3Info.open(audio_file.queued_for_write[:original].path) do |mp3|
            mp3.tag.title = title
            mp3.tag.artist = speaker
            mp3.tag.comments = summary
            mp3.tag.album = series
            write_attribute :length_s, mp3.length
        end
    end

    def get_duration
        if length_s == nil
            return 0
        end
        if length_s >= 60 * 60
            return Time.at(length_s).strftime("%H:%M:%S")
        else
            return Time.at(length_s).strftime("%M:%S")
        end
    end

    validates_attachment :audio_file, content_type: {content_type: "audio/mpeg" }
end
