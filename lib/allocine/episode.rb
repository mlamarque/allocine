module Allocine
  
  class Episode

    # Represent an Episode on Allocine website
    # s = Allocine::Episode.new(233014)
    # e = s.title
    
    attr_accessor :title, :synopsis, :number, :release_date
    
    def initialize(allocine_id)
      @id = allocine_id
    end
    
    # Returns the season parent
    def season
      Allocine::Season.new(document["parentSeason"]["code"])
    end

    # Returns the serie parent
    def serie
      Allocine::Serie.new(document["parentSeries"]["code"])
    end
    
    # Returns the title
    def title
      document["title"] rescue nil
    end

    # Returns the original title
    def original_title
      document["originalTitle"] rescue nil
    end
    
    # Returns the broadcast date
    def original_broadcast_date
      document["originalBroadcastDate"] rescue nil
    end
    
    # Returns the plot
    def plot(short = true)
      short == true ? document["synopsisShort"] : document["synopsis"] 
    end
    
    def episode_number_series
      document["episodeNumberSeries"]
    end

    def episode_number_season
      document["episodeNumberSeason"]
    end

    private
    
     def document
       @document ||= Allocine::Episode.find_by_id(@id)
     end

     def self.find_by_id(allocine_id)
       url = "http://api.allocine.fr/rest/v3/episode?partner=YW5kcm9pZC12M3M&code=#{allocine_id}&profile=large&format=json"
       JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)["episode"]
     end
    
  end
end
