module Allocine

  class MovieList
    def movies
      @movies ||= parse_movies
    end
    
    private
    def parse_movies
      id, originalTitle = nil
      movies = []
      document["movie"].each do |element|
        id = element['code']
        title = element['originalTitle']
        movies << Allocine::Movie.new(id, originalTitle)
      end
      movies
    end
  end

end
