class Artist

  @@all = []
  @@songs = 0

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def add_song(song)
    @songs << song
    @@songs += 1
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artists_name)
    Artist.all.find { |instance| instance.name == artists_name } || Artist.new(artists_name)
  end

  def print_songs
    self.songs.each { |song| puts song.name  }
  end

end
