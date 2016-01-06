#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
    xml.channel do
        xml.title = @feed_gen.title
        xml.author = @feed_gen.author
        xml.description = @feed_gen.description
        xml.link = @feed_gen.link
        xml.language = @feed_gen.language
    end
end

