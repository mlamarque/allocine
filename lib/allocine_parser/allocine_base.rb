module Allocine
  
  require 'rubygems'
  require 'json'
  require 'net/http'
  
  # Represents a AllocineBase
  class AllocineBase
    attr_accessor :id, :url, :title
    
    def initialize(allocine_id, title = nil)
      @id = allocine_id
      @url = "http://api.allocine.fr/rest/v3/movie?code=#{allocine_id}&profile=large&format=json&partner=YW5kcm9pZC12M3M"
    end
    
    # Returns the name of the director
    def directors
      document["castingShort"]["directors"].split(", ") rescue nil
    end

    # Returns an array with cast members
    def actors
      document["castingShort"]["actors"].split(", ") rescue nil
    end

    # Returns an array of genres (as strings)
    def genres
      document["genre"].collect {|gender| gender["$"]} rescue nil
    end

    # Returns an array of countries as strings.
    def countries
      document["nationality"].collect {|nation| nation["$"]} rescue nil
    end
    
    # Returns the duration of the movie in minutes as an integer.
    def length
      document["runtime"].to_i/60 rescue nil 
    end
    
    # Returns a string containing the URL to the movie poster.
    def poster
      document["poster"]["href"] rescue nil 
    end
    
    # Returns a string containing trailer code.
    def trailer_id
      document["trailer"]["code"] rescue nil 
    end

    # Returns a string containing the URL to the movie trailer.
    def trailer
      document["trailer"]["href"] rescue nil 
    end
    
    # Returns a float containing the average user rating
    def press_rating
      document["statistics"]["pressRating"] rescue nil 
    end

    # Returns an int containing the number of user ratings
    def user_rating
      document["statistics"]["userRating"] rescue nil 
    end
        
    # Returns a string containing the title
    def title(force_refresh = false)
      if @title && !force_refresh
        @title
      else
        @title = document["title"] rescue nil 
      end
    end

    # Returns originalTitle.
    def original_title
      document["originalTitle"] rescue nil
    end
    
    
    # Returns release date for the movie.
    def release_date
      document["release"]["releaseDate"] rescue nil
    end
        
    # Return production Year for the movie
    def production_year
      document["productionYear"]
    end
    
    def plot(short = true)
      short ? document["synopsisShort"] : document["synopsis"]
    end

    private
    
    def document
      @document ||= Allocine::Movie.find_by_id(@id)
    end
    
    def self.find_by_id(allocine_id)
      url = "http://api.allocine.fr/rest/v3/movie?code=#{allocine_id}&profile=large&format=json&partner=YW5kcm9pZC12M3M"
      JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)["movie"] rescue nil
    end
    
    # Convenience method for search
    def self.search(query)
      Allocine::Search.new(query).movies
    end
        
  end
  
end
