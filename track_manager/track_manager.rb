require_relative '../model/track'

class TrackManager

  attr_reader :talks
  attr_accessor :tracks
  
  def initialize(talks)
    @talks = talks
    @tracks = []
  end
   
  def process
    while !talks.empty?
      talks.each do |talk|
        track = get_free_track(talk)
        talks.delete(talk) if track.add_talk(talk)
      end
    end
    complete_tracks
  end

  private

  def complete_tracks
    tracks.each do |track|
      track.complete
    end
  end

  def get_free_track(talk)
    if tracks.empty?
      tracks << new_track
      tracks.first
    else
      free_track = tracks.select {|track| track.can_add?(talk) }.first
      unless free_track
        free_track = new_track
        tracks << free_track
      end
      free_track
    end
  end

  def new_track
    Track.new("Track #{tracks.count+1}")
  end

end