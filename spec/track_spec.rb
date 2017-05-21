require 'spec_helper'
 
describe Track do

  before :each do
    @track = Track.new "Test-Track"
  end

  context "#Creation" do
    
    it 'is expected to be created' do
      expect(@track).to be_truthy
    end
    
    it 'is expected to have title' do
      expect(@track.name).to eq("Test-Track")
    end

    it 'is expected to have morning and after noon session' do
      expect(@track.morning_session).to be_truthy
      expect(@track.after_noon_session).to be_truthy
    end

    it 'is expected to be free' do
      talk = Talk.new("Title", 60)
      expect(@track.can_add?(talk)).to eq(true)
    end

  end

  context "#Add talk" do

    before :each do
      @talk = Talk.new("Title", 60)
    end
    
    it 'must be able to add talk' do
      tracks = @track.add_talk(@talk)
      expect(@track.add_talk(@talk)).to be_truthy
    end
  end
 
end