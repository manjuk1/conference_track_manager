require 'spec_helper'
 
describe Talk do

  before :each do
    @talk = Talk.new "Title", 60
  end

  describe "#Creation" do
    
    it 'is expected to be created' do
      expect(@talk).to be_truthy
    end
    
    it 'is expected to have title' do
      expect(@talk.title).to eq("Title")
    end

    it 'is expected to have time in minutes' do
      expect(@talk.time_minutes).to eq(60)
    end

  end
 
end