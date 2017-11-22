require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self
    @songs << song
  end

  def save
    self.class.all << self
  end

  def self.find_or_create_by_name(name)
    found = self.all.detect { |a| a.name == name}
     if !found
       artist = Artist.new(name)
       artist.save
       artist
     else
       found
     end
  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

  def self.all
    @@all
  end

end
