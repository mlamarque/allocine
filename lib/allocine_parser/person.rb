module Allocine
  
  class Person
    
    # s = Allocine::Person.new(41339)
    # e = s.name
    
    def initialize(allocine_id, title = nil)
      @id = allocine_id
      @url = "http://api.allocine.fr/rest/v3/person?partner=YW5kcm9pZC12M3M&profile=large&code=#{allocine_id}&format=json"
    end

    # Returns name of person    
    def name
      document["name"]["given"] + " " +document["name"]["family"] rescue nil
    end

    # Returns nationality of person
    def nationality
      document["nationality"].collect {|nation| nation["$"]} rescue nil
    end

    # Returns gender of person
    def gender
      # 1 => male
      # 0 => female
      document["gender"] rescue nil
    end

    # Returns activities of person    
    def activity_short
      document["activityShort"] rescue nil
    end

    # Returns biography of person    
    def biography(short = true)
      short == true ? document["biographyShort"] : document["biography"] rescue nil
    end

    # Returns birth_date of person    
    def birth_date
      document["birthDate"] rescue nil
    end
    
    # Returns picture of person    
    def picture
      document["picture"]["href"] rescue nil
    end

    private

    def document
      @document ||= Allocine::Person.find_by_id(@id)
    end

    def self.find_by_id(allocine_id)
      url = "http://api.allocine.fr/rest/v3/person?partner=YW5kcm9pZC12M3M&profile=large&code=#{allocine_id}&format=json"
      JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)["person"]
    end
      
  end
end

