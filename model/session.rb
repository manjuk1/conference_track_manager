require 'time'

class Session

  attr_reader :talks, :type

  MORNING_SESSION_START = "9AM"
  MORNING_SESSION_END = "12PM"
  AFTER_NOON_SESSION_START = "1PM"
  NETWORKING_EVENT_TIME_WINDOW_START = "4PM"
  NETWORKING_EVENT_TIME_WINDOW_END = "5PM"

  LUNCH_BREAK_TITLE = "Lunch Break"
  LUNCH_BREAK_MINUTES = 60

  NETWORK_EVENT_TITLE = "Networking Event"
  NETWORK_EVENT_MINUTES = 0
  
  TYPE = {
    MORNING: 1,
    AFTER_NOON: 2
  }

  def initialize(type)
    @talks = []
    @type = type
  end

  def can_add?(talk)
    last_time = talks.last.end_time.utc if talks.last
    if type == TYPE[:MORNING]
      (( last_time || DateTime.parse(MORNING_SESSION_START).to_time.utc ) + (talk.time_minutes * 60)) <= DateTime.parse(MORNING_SESSION_END).to_time.utc
    else
      (( last_time || DateTime.parse(AFTER_NOON_SESSION_START).to_time.utc ) + ( talk.time_minutes * 60 )) <= DateTime.parse(NETWORKING_EVENT_TIME_WINDOW_END).to_time.utc
    end
  end

  def add_talk(talk)
    if can_add?(talk)
      talks.last ? schedule_talk(talk) : schedule_first_talk(talk)
      talk.scheduled = true
      talks << talk
      true
    else
      false
    end
  end

  def push_last_event
    if type == TYPE[:MORNING]
      talks << lunch_break
    else
      talks << networking_break
    end
  end

  private

  def schedule_talk(talk)
    talk.start_time = talks.last.end_time.utc
    talk.end_time = talk.start_time + ( talk.time_minutes * 60)
  end

  def schedule_first_talk(talk)
    if type == TYPE[:MORNING]
      talk.start_time = DateTime.parse(MORNING_SESSION_START).to_time.utc
      talk.end_time = DateTime.parse(MORNING_SESSION_START).to_time.utc + ( talk.time_minutes * 60)
    else
      talk.start_time = DateTime.parse(AFTER_NOON_SESSION_START).to_time.utc
      talk.end_time = DateTime.parse(AFTER_NOON_SESSION_START).to_time.utc + ( talk.time_minutes * 60 ) 
    end
  end

  def lunch_time_reached?(talk)
    talk.end_time ==  DateTime.parse(MORNING_SESSION_END).to_time.utc
  end
  
  def network_event_time_window_reached?(talk)
    (talk.end_time >=  DateTime.parse(NETWORKING_EVENT_TIME_WINDOW_START).to_time.utc) && 
    (talk.end_time <=  DateTime.parse(NETWORKING_EVENT_TIME_WINDOW_END).to_time.utc)
  end

  def lunch_break
    talk = Talk.new(LUNCH_BREAK_TITLE, LUNCH_BREAK_MINUTES)
    talk.start_time = DateTime.parse(MORNING_SESSION_END).to_time.utc
    talk.end_time = DateTime.parse(AFTER_NOON_SESSION_START).to_time.utc
    talk
  end

  def networking_break
    talk = Talk.new(NETWORK_EVENT_TITLE, NETWORK_EVENT_MINUTES)
    if talks.last
      talk.start_time = talks.last.end_time.to_time.utc
    else
      talk.start_time = DateTime.parse(NETWORKING_EVENT_TIME_WINDOW_START).to_time.utc
    end
    talk
  end

end
