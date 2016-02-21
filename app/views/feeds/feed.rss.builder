#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss("version" => "2.0", "xmlns:content" => "http://purl.org/rss/1.0/modules/content/", "xmlns:dc" => "http://purl.org/dc/elements/1.1/", "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd") do
    xml.channel do
        xml.title @feed_gen.title
        xml.link @feed_gen.link
        xml.language @feed_gen.language
        xml.copyright @feed_gen.copyright
        xml.itunes :subtitle, @feed_gen.title
        xml.itunes :author, @feed_gen.author
        xml.itunes :summary, @feed_gen.summary
        xml.description @feed_gen.description
        xml.itunes :owner do
            xml.itunes :name, @feed_gen.owner_name
            xml.itunes :email, @feed_gen.owner_mail
        end
        #xml.itunes :image, :text => @feed_gen.logo
        xml.itunes :category, :text => @feed_gen.category

        xml.author @feed_gen.author

        for item in @feed_items
            xml.item do
                xml.title item.title
                xml.description item.summary
                xml.itunes :author, item.speaker
                xml.itunes :subtitle, item.title
                xml.itunes :summary, item.summary
                xml.dc :creator, item.speaker
                xml.link item.audio_file.url
                xml.guid item.audio_file.url
                    xml.enclosure :url => item.audio_file.url, :type => item.audio_file_content_type, :length => item.audio_file_file_size
                    xml.itunes :duration, item.get_duration
                #xml.itunes :image, :href => "" @TODO
                #prevent error on nil
                unless item.audio_file_updated_at.nil?
                    xml.pubDate item.audio_file_updated_at.to_formatted_s(:rfc822)#"Mon, 28 Dec 2015 12:00:00 +0100"
                end
            end
        end
    end
end

