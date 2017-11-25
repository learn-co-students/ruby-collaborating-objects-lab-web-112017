require "pry"

class Artist

attr_accessor :name
attr_reader :songs
@@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    self.songs << song
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    var = @@all.find { | artist | artist.name == name }

    if !var
      name = self.new(name)
      name.save
      name
    else
      var
    end

    # if !@@all.include?(name)
    #   name = self.new(name)
    #   name.save
    #   name
    # else
    #   @@all.find { | artist | artist == name }
    # end


  end

  def print_songs


      self.songs.each { |song| puts song.name }


  end





end
