require_relative 'base_reader'

class TxtReader < BaseReader

  def initialize(input_file)
    super(input_file)
  end

  def each_line
    File.open(input_file, "r") do |infile|
      while (line = infile.gets)
          split_words = line.split(" ")
          time_minutes = split_words.last == "lightning" ? lightning : split_words.last.to_i
          title = split_words.join(" ")
          yield(title, time_minutes)
      end
    end
  end

end