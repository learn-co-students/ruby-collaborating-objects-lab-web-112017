require "pry"
class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)

    song = Song.new(file_name.split(" - ")[1].split(" - ")[0])
    songartist = Artist.find_or_create_by_name(file_name.split(" - ")[0].split(" - ")[0])
    songartist.add_song(song)
    song
  end

  def self.get_title_from_file(file_name)
    returnval = file_name.split(" - ")[1].split(" - ")[0]
    returnval
  end

end
