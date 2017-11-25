require "pry"

class Song
  attr_accessor :name, :artist


  def initialize(name)
    @name = name
  end


  def self.new_by_filename (some_filename)
    filename = some_filename.split(" - ")
    filename_object = self.new(filename[1])
    filename_object.artist = Artist.find_or_create_by_name(filename[0])
    filename_object.artist.add_song(self)
    filename_object
  end


end
