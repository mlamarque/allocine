# coding: utf-8

require File.dirname(__FILE__) + '/../spec_helper.rb'

# This test uses "Star Wars : Episode I - La Menace fantôme " as a testing sample:
#   
#     http://api.allocine.fr/rest/v3/movie?code=20754&profile=large&format=json&partner=YW5kcm9pZC12M3M
#

describe "Allocine::Movie" do
  
  describe "valid movie" do

    before(:each) do
      @movie = Allocine::Movie.new("20754")
    end
  
    it "should find the cast members" do
      cast = @movie.actors
    
      cast.should be_an(Array)
      cast.should include("Liam Neeson")
      cast.should include("Natalie Portman")
      cast.should include("Jake Lloyd")
      cast.should include("Ian McDiarmid")
    end

    it "should find the directors" do
      @movie.directors.should be_an(Array)
      @movie.directors.size.should eql(1)
      @movie.directors.first.should =~ /George Lucas/
    end
  
    it "should find the genres" do
      genres = @movie.genres
      genres.should be_an(Array)
      genres.should include('Science fiction')
      genres.should include('Fantastique')
      genres.should include('Aventure')
    end

    it "should find the countries" do
      countries = @movie.countries

      countries.should be_an(Array)
      countries.size.should eql(1)
      countries.should include('U.S.A.')
    end    

    it "should find the length (in minutes)" do
      @movie.length.should eql(133)
    end
  
    it "should find the plot" do
      @movie.plot.should eql("Il y a bien longtemps, dans une galaxie très lointaine... La Fédération du Commerce impose par la force la taxation des routes commerciales à la pacifique planète Naboo. Les chevaliers Jedi Qui-Gon Jinn et Obi-Wan Kenobi sont envoyés sur place...")
    end
  
    it "should find the poster" do
      @movie.poster.should eql("http://images.allocine.fr/medias/nmedia/18/86/24/04/19835018.jpg")
    end
  
    it "should find the press rating" do
      @movie.press_rating.should eql(3.125)
    end
  
    it "should find the title" do
      @movie.title.should =~ /Star Wars : Episode I - La Menace fantôme/
    end
    
    it "should find the production year" do
      @movie.production_year.should eql(1999)
    end

    it "should find the release date" do
      @movie.release_date.should eql("1999-10-13")
    end
    
    it "should find the trailer" do
      @movie.trailer.should eql("http://www.allocine.fr/blogvision/19259278")
    end
  end
    
end
