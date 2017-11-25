class Song

attr_accessor :name, :artist

@@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
    self
  end

   def self.find_by_artist(artist)
     Song.all.select do |song|
       song.artist == artist
     end
   end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
    self.artist.add_song(self)
  end

  def self.new_by_filename(file_name)
    name = file_name.split(" - ")[1]
    artist_name = file_name.split(" - ")[0]
    song = self.new(name)
    song.artist_name=(artist_name)
    song.save
  end



end
