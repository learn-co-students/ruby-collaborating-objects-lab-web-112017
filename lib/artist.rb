#
# class Artist
#   attr_accessor :name
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     @songs = []
#   end
#
#   def self.save
#     @@all << self
#   end
#
#   def songs
#     @songs
#   end
#
#   def add_song(song)
#     @songs << song
#     song.artist = self
#   end
#
#
# end

class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.find_or_create_by_name(name_of_artist)
    artist = self.all.detect {|artist_obj| artist_obj.name == name_of_artist}
    if artist == nil
      artist = self.new(name_of_artist)
      artist.save
    end
    artist
  end

  def add_song(song)
    self.songs << song
    song.artist = self
  end

  def print_songs
    self.songs.each do |song_obj|
      puts song_obj.name
    end
  end

end
