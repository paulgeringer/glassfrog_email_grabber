require "open-uri"

class URIParser

  attr_reader :parser

  def initialize( parser = URI )
    @parser = parser
  end

  def url_generator path
    "#{GLASSFROG_URI}#{path}.xml?api_key=#{GLASSFROG_KEY}"
  end

  def uri_parse url
    parser.parse( url_generator( url ) ).read
  end

  def get_xml path
    xml = uri_parse( path )
  end

end
