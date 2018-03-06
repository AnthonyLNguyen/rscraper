require 'httparty'
class Container
    include HTTParty
	
    attr_accessor :parser
    
    def initialize(url)
		url = HTTParty.get(url)
        # only replace if null
		@parser ||= Nokogiri::HTML(url)
    end
    
    def parse_tags(tags)
        arr = tags.split(" ")
        result = parser.css(arr[0])
        arr.each do|a|
            result = result.css(a)
        end
        return result
    end
end