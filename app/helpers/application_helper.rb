
module ApplicationHelper

    def get_mp3_duration(file_name = '')
        require "mp3info"
        if file_name == ''
            return 0
        end
        Mp3Info.open(file_name) do |mp3|
            mp3.length
        end
    end
end
