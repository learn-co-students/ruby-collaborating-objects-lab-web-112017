require "pry"

class Artist

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    song.artist = self
    self.songs << song
  end

  def self.all
    @@all.uniq
  end

  def save
    @@all << self
  end

  def print_songs
    self.songs.each do |song|
      puts song.name
    end
  end

  def self.find(name)
    self.all.detect do |artist|
      artist.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find(name) || self.new(name)
  end

end

# sza = Artist.new("Sza")
# sza.save
# binding.pry
