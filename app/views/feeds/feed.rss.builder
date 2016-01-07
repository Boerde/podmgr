#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss("version" => "2.0", "xmlns:content" => "http://purl.org/rss/1.0/modules/content/", "xmlns:dc" => "http://purl.org/dc/elements/1.1/", "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd") do
    xml.channel do
        xml.title @feed_gen.title
        xml.author @feed_gen.author
        xml.description @feed_gen.description
        xml.link @feed_gen.link
        xml.language @feed_gen.language

        for item in @feed_items
            xml.item do
                xml.title item.title
                xml.description item.summary
                xml.link item.file_path
                xml.guid item.file_path
            end
        end
    end
end

