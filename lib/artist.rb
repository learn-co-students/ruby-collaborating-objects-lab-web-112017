class Artist

attr_accessor :name

@@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    @songs << song
  end

   def songs
     @songs || Song.find_by_artist(self)
   end

   def self.all
     @@all
   end

   def save
     @@all << self
     self
   end

   def print_songs
     self.songs.each do |song|
       puts "#{song.name}"
     end
   end

   def self.find_by_name(name)
      self.all.detect {|artist| artist.name == name}
   end

   def self.create_by_name(name)
      artist = self.new(name)
      # artist.save
      artist
   end


   def self.find_or_create_by_name(name)
       self.find_by_name(name) || self.create_by_name(name)
   end

end
