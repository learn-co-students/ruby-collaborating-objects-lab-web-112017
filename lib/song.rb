require "pry"

class Song

  attr_accessor :name, :artist, :genre

  def initialize(name)
    @name = name
    @artist = nil
  end

  def self.new_by_filename(file_name)
    row = file_name.split(" - ")
    artist_name = row[0]
    song_name = row[1]
    newsong = Song.new(song_name)
    req_artist = Artist.find_or_create_by_name(artist_name)
    req_artist.add_song(newsong)
    newsong
  end

end
