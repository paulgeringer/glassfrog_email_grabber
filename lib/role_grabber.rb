require './uri_parser'
require './email_retriever'
require './circle_grabber'

class RoleGrabber
  attr_reader :circle_hash, :parser, :emailer

  def initialize( parser = URIParser.new, emailer = XMLParser.new, circle_hash = CircleGrabber.new.circle_id_hash )
    @parser = parser
    @emailer = emailer
    @circle_hash = circle_hash
  end

  def role_emails( circle, role, hash = circle_hash )
    circle_id = circle_hash[circle]
    xml = parser.uri_parse( parser.url_generator "circle/#{circle_id}/roles" )
    email_array = emailer.xpath_navigator( emailer.xml_parser( xml ), 'circle/role' )
    role_array = email_array.map do |role|
      role.xpath('./filled-by').children.xpath('./name')
    end
    role_array 
    #role_array = [] 
    #email_array.each do |role|
      #role_array << role.xpath('filled-by')
    #end
    #role_array
    #emailer.email_map( email_array )
    #email_array.each do {|role|
      #role.next_element.next_element.next_elementV`
  end
end
