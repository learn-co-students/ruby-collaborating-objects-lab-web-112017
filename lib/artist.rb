require 'pry'

class Artist

attr_accessor :name, :songs

@@all = []


  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def save
    @@all << self
  end

  #for below -- why is it necessary to have this method?  is there another way to make it an accessor?
  def self.all
    @@all
  end

  #how best to refactor the below?
  def self.find_or_create_by_name(artist_name)
    wanted = nil
    @@all.each_with_index do |artist_object, index|
      if artist_object.name == artist_name
        wanted = @@all[index]
      end
    end
    if wanted == nil
      return artist = Artist.new(artist_name)
    else
      return wanted
    end
  end

  #how to refactor this?
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end


end
