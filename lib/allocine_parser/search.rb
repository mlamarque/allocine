module Allocine
  
  class Search < MovieList
    attr_reader :query

    # Initialize a new Allocine search with the specified query
    #
    #   search = Allocine::Search.new("Superman")
    #
    def initialize(query)
      @query = query
    end
    
    # Returns an array of Allocine::Movie objects for easy search result yielded.
    def movies
      @movies ||= parse_movies
    end

    private
    def document
      @document ||= Allocine::Search.query(@query)
    end
    
    def self.query(query)
      url = "http://api.allocine.fr/rest/v3/search?partner=YW5kcm9pZC12M3M&filter=movie,tvseries&q=#{query}&format=json"
      JSON.parse(Net::HTTP.get_response(URI.parse(URI.encode(url))).body)["feed"] rescue nil
    end
        
    
  end
end
