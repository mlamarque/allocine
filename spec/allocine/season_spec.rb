# coding: utf-8

require File.dirname(__FILE__) + '/../spec_helper.rb'

# This test uses "Lost - season 6" as a testing sample:
#   
#     http://api.allocine.fr/rest/v3/season?partner=YW5kcm9pZC12M3M&code=#{allocine_id}&profile=large&format=json
#

describe "Allocine::Season" do
  
  describe "valid season" do

    before(:each) do
      @serie = Allocine::Season.new("12277")
    end
    
    it "should find the season_number" do
      @serie.season_number.should eql(6)
    end
      
    it "should find the episode count" do
      @serie.episode_count.should eql(18)
    end
    
    it "should find the serie parent" do
      @serie.serie.id.should eql(223)
    end
    
  end
    
end
