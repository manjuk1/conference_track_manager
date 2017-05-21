require_relative 'builder/talks_builder'
require_relative 'track_manager/track_manager'

class ConferenceScheduler
  
  attr_reader :input_file, :talks, :track_manager
  
  def initialize(input_file)
    @input_file = "#{Dir.pwd}/#{input_file}"
  end

  def process
    begin
      build_talks
      schedule_talks
      true
    rescue Exception => e
      puts "Error occured while scheduling : #{e.message}"
      false
    end
  end

  def show_schedule
    track_manager.tracks.each do |track|
      puts "#{track.name}:"
      track.show_talks
    end
  end

  private

  def build_talks
    @talks = TalksBuilder.new(input_file).build
  end

  def schedule_talks
    @track_manager = TrackManager.new(sorted_talks)
    track_manager.process
  end

  def sorted_talks
    talks.sort { |t1, t2| t1.time_minutes <=> t2.time_minutes}.reverse
  end
end

########################################
# Entry Point to Conference Scheduler
########################################

scheduler = ConferenceScheduler.new(ARGV[0])
scheduler.show_schedule if scheduler.process
