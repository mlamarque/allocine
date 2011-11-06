module Allocine
  
  class Serie < AllocineBase
    
    # s = Allocine::Serie.new(223)
    # e = s.seasons.first.episodes.first
    

    def initialize(allocine_id, title = nil)
      @id = allocine_id
      @url = "http://api.allocine.fr/rest/v3/tvseries?partner=YW5kcm9pZC12M3M&code=#{allocine_id}&profile=large&format=json"
    end

    def number_of_seasons
      document["seasonCount"] rescue nil
    end
    
    def number_of_episodes
      document["episodeCount"] rescue nil
    end
    
    def year_start
      document["yearStart"] rescue nil
    end
    
    def year_end
      document["yearEnd"] rescue nil
    end

    def season_ids
      document["season"].map { |season| season["code"]} rescue []
    end
    
    def seasons
      s = []
      season_ids.each do |allocine_id|
        s << Allocine::Season.new(allocine_id)
      end
      s
    end

    private

    def document
      @document ||= Allocine::Serie.find_by_id(@id)
    end

    def self.find_by_id(allocine_id)
      url = "http://api.allocine.fr/rest/v3/tvseries?partner=YW5kcm9pZC12M3M&code=#{allocine_id}&profile=large&format=json"
      JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)["tvseries"]
    end
      
  end
end
