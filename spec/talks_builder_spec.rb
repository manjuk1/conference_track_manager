require 'spec_helper'
 
describe TalksBuilder do

  context "#Build" do
    before :each do
       input_file = "#{Dir.pwd}/input.txt"
       @builder = TalksBuilder.new(input_file)
    end
    
    it 'is expected to build talks' do
      expect(@builder.build.count).to eq(19)
    end
  end
     
  context '#Invalid File' do
    it 'is expected to fail' do
      input_file = "#{Dir.pwd}/input.ofs"
      @builder = TalksBuilder.new(input_file)
      expect { @builder.build }.to raise_error(RuntimeError)
    end
  end
 
end