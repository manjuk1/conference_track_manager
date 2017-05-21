class Talk

  MAX_TALK_MINUTES = 240
  
  attr_reader :title, :time_minutes
  attr_accessor :start_time, :end_time, :scheduled
  
  def initialize(title, time_minutes)
    @title = title
    @time_minutes = time_minutes
  end

end