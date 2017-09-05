
module ApplicationHelper
  def get_mp3_duration(file_name = '')
    require 'mp3info'
    return 0 if file_name == ''
    Mp3Info.open(file_name, &:length)
  end
end
