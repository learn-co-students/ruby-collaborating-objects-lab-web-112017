require 'pry'
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(song)
    formatted = song.split(" - ")
    song = Song.new(formatted[1])
    song.artist = Artist.find_or_create_by_name(formatted[0])
    song.artist.add_song(song)
    song
  end


end
