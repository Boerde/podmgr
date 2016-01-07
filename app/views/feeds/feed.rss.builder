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
        xml.itunes :summary, "test sum"
        xml.description @feed_gen.description
        xml.itunes :owner do
            xml.itunes :name, "test name"
            xml.itunes :email, "test@mail.de"
        end
        xml.itunes :image, :text => "test image"
        xml.itunes :category, :text => "test category"

        xml.author @feed_gen.author

        for item in @feed_items
            xml.item do
                xml.title item.title
                xml.description item.summary
                xml.itunes :author, item.speaker
                xml.itunes :subtitle, item.title
                xml.itunes :summary, item.summary
                xml.dc :creator, item.speaker
                xml.link item.file_path
                xml.guid item.file_path
                xml.enclosure :url => item.file_path, :type => "audio/mpeg", :length => "0"
                xml.itunes :duration, "0"
                xml.itunes :image, :href => "logo test"
                xml.pubDate "28 Dec 2015 12:00:00 +0100"
            end
        end
    end
end

