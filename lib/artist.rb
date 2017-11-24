require 'pry'
class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist)
    @@all.each do |i|
      if i.name == artist
         return i
      end
    end

    artist = Artist.new(artist)
    return artist
  end

  def print_songs
    @songs.each {|x| puts x.name}
  end

end
