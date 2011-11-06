# coding: utf-8

require File.dirname(__FILE__) + '/../spec_helper.rb'

# This test uses "Lost - season 6 episode 1" as a testing sample:
#   
#     http://api.allocine.fr/rest/v3/episode?partner=YW5kcm9pZC12M3M&code=#{allocine_id}&profile=large&format=json
#

describe "Allocine::Episode" do
  
  describe "valid episode" do

    before(:each) do
      @episode = Allocine::Episode.new("233014")
    end

    it "should find the plot" do
      @episode.plot.should eql("Deux situations parallèles se font face. Dans la première, l'explosion a eu l'effet escompté. A bord du vol Oceanic 815 entre Sydney à Los Angeles, l'appareil subit de violentes turbulences qui cessent rapidement. Mais des choses ont changé : Desmond est là alors qu'à l'origine, il n'était pas à bord...")
    end
      
    it "should find the title" do
      @episode.title.should =~ /On efface tout/
    end
    
    it "should find the the broadcast date" do
      @episode.original_broadcast_date.should eql("2010-02-02")
    end

    it "should find the serie parent" do
      @episode.serie.id.should eql(223)
    end
    
    it "should find the season parent" do
      @episode.season.id.should eql(12277)
    end
  end
    
end
