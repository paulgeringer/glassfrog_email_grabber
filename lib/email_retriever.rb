require 'nokogiri'

class XMLParser
  attr_reader :driver

  def initialize( driver = Nokogiri::XML )
    @driver = driver
  end

  def xml_parser unparsed_xml
    driver.parse(unparsed_xml)
  end

  def xpath_navigator xml, path
    emails = xml.xpath(path)
  end

  #emails.map {|email| "#{email.text}" }
end
