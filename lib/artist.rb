class Artist
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    song.artist = self
    @songs << song
    #@@all << song
  end

  def save
    #binding.pry
    @@all << self
  end

  def self.all
    #binding.pry
      @@all
  end

  def self.find_or_create_by_name(name)
    val = @@all.find { |e|
      #binding.pry
      e.name == name  }
    #binding.pry
    if val != nil
      #binding.pry
      return val
    else
      #binding.pry
      Artist.new(name)
      #binding.pry
    end
  end

  def print_songs
     @songs.each do |e|
      puts e.name
    end
  end

end
