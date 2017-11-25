require 'pry'
# class Song
#   attr_accessor :name, :artist
#
#   def initialize(name)
#     @name = name
#   end
#
#   def artist_name(name)
#     if (self.artist.nil?)
#       self.artist = Artist.new(name)
#     else
#       self.artist.name = file_name
#     end
#   end
#
#   # def artist=(artist)
#   #   self.artist = Artist.new(artist)
#   # end
#
# end
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def artist_name=(name_of_artist)
    Artist.find_or_create_by_name(name_of_artist).add_song(self)
  end

  def self.new_by_filename(filename)
    song = self.new(filename.split(" - ")[1])
    song.artist_name=(filename.split(" - ")[0])
    song
  end

end
