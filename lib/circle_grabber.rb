require './uri_parser'
require './email_retriever'

class CircleGrabber
  attr_reader :parser, :emailer

  def initialize( parser = URIParser.new, emailer = XMLParser.new )
    @parser = parser
    @emailer = emailer
  end

  def circle_array
    xml = parser.uri_parse( parser.url_generator( "circle" ) )
    emailer.xpath_navigator( emailer.xml_parser( xml ), 'circles/circle' )
  end

  def circle_id_hash
    circle_hashes = circle_array.map do |circle|
      { id: circle.xpath('id').text, name: circle.xpath('name').text }
    end
    names_to_ids = {}
    circle_hashes.each { |circle| names_to_ids[circle[:name]] = circle[:id] }
    names_to_ids
  end

  def circle_emails( circle, hash = circle_id_hash )
    circle_id = hash[circle]
    xml = parser.uri_parse( parser.url_generator "circle/#{circle_id}/mailing_list" )
    email_array = emailer.xpath_navigator( emailer.xml_parser( xml ), 'people/person/email' )
    emailer.email_map( email_array )
  end

end

	#circles_xml = get("circle")
	#circles = Nokogiri::XML.parse(circles_xml).xpath("circles/circle")
  #circle_hashes = circles.map do |circle|
    #{id: circle.xpath('id').text, name: circle.xpath('name').text}
  #end
	#names_to_ids = {}
	#circle_hashes.each { |circle| names_to_ids[circle[:name]] = circle[:id]}
	#if target_circle 
		#circle_id = names_to_ids[target_circle]
		#puts get_emails get "circle/#{circle_id}/mailing_list"
	#else
		#puts "please specify a circle from the below:"
		#puts circle_hashes.map {|circle| circle[:name]}
	#end
