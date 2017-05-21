require_relative 'session'

class Track
  
  attr_accessor :name
  attr_reader :morning_session, :after_noon_session

  def initialize(name)
    @name = name
    @morning_session = Session.new(Session::TYPE[:MORNING])
    @after_noon_session = Session.new(Session::TYPE[:AFTER_NOON])
  end

  def add_talk(talk)
    if morning_session.can_add?(talk)
      morning_session.add_talk(talk)
    elsif after_noon_session.can_add?(talk)
      after_noon_session.add_talk(talk)
    end
  end

  def can_add?(talk)
    morning_session.can_add?(talk) || after_noon_session.can_add?(talk)
  end

  def complete
    morning_session.push_last_event && after_noon_session.push_last_event
  end

  def show_talks
    morning_session.talks.each do |talk|
      puts "#{talk.start_time.strftime("%I:%M %p")} : #{talk.title}"
    end
    after_noon_session.talks.each do |talk|
      puts "#{talk.start_time.strftime("%I:%M %p")} : #{talk.title}"
    end
  end
end