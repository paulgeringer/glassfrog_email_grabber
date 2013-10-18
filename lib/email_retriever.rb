class EmailRetriever
  attr_reader :driver

  def initialize( driver = Nokogiri::XML )
    @driver = driver
  end

  def xml_parser unparsed_xml
    driver.parse(xml)
  end

  def email_mapper xml, path
    emails = xml.xpath(path)
    emails.map {|email| "#{email.text}" }
  end

end
