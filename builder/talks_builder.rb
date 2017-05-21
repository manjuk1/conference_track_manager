require_relative "../input_reader/txt_reader"
require_relative "../model/talk"

class TalksBuilder
  
  attr_reader :input_file, :file_type, :reader

  def initialize(input_file)
    @input_file = input_file
    @file_type = File.extname(input_file).strip.downcase[1..-1]
    @reader = file_reader ? file_reader.new(input_file) : file_reader
  end

  def build
    raise 'Invalid file' unless reader 
    talks = []
    reader.each_line do |title, time_minutes| 
      raise "Talks more than #{Talk::MAX_TALK_MINUTES} minutes not allowed" if time_minutes > Talk::MAX_TALK_MINUTES
      talks << Talk.new(title, time_minutes)
    end
    talks
  end

  private
   
  def file_reader
    case file_type
    when "txt" then TxtReader
    else
      nil
    end
  end

end