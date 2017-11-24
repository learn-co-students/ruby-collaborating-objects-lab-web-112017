class Artist

  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def name=(name)
    @name = name
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
     self.find(name) ? self.find(name) : self.create(name)
   end

   def self.find(name)
     self.all.find {|artist| artist.name == name }
   end

   def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
   end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
