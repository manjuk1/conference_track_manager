require 'spec_helper'
 
describe Session do

  before :each do
      @morning_session = Session.new Session::TYPE[:MORNING]
      @after_noon_session = Session.new Session::TYPE[:AFTER_NOON]
  end

  context "#Creation" do

    before :each do
      @talk = Talk.new("Title", 60)
    end
    
    it 'is expected to be created' do
      expect(@morning_session).to be_truthy
      expect(@after_noon_session).to be_truthy
    end
    
    it 'is expected to be created with proper types' do
      expect(@morning_session.type).to eq(Session::TYPE[:MORNING])
      expect(@after_noon_session.type).to eq(Session::TYPE[:AFTER_NOON])
    end

    it 'is expected to be able to add talk' do
      expect(@morning_session.can_add?(@talk)).to eq(true)
      expect(@after_noon_session.can_add?(@talk)).to eq(true)
    end

  end

  context "#Add talk" do

    before :each do
      @valid_talk = Talk.new("Title", 60)
      @invalid_talk = Talk.new("Title", 300)
    end
    
    it 'must be able to add talk' do
      expect(@morning_session.add_talk(@valid_talk)).to be_truthy
      expect(@after_noon_session.add_talk(@valid_talk)).to be_truthy
    end

    it 'must not be able to add talk' do
      expect(@morning_session.add_talk(@invalid_talk)).to be_falsey
      expect(@after_noon_session.add_talk(@invalid_talk)).to be_falsey
    end
  end
 
end