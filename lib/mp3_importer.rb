require "pry"

class MP3Importer

  attr_accessor :path, :files


  def initialize(path)
    @path = path
    @files = []
  end

  def files
    @files = Dir["#{self.path}/*"]
    @files.map {|file| file.split("/")[-1]}
  end

  def import
    self.files.each do |file|
      # binding.pry
      new_artist = Artist.find_or_create_by_name(file.split(" - ")[0])
      new_artist.add_song(file.split(" - "[1]))
    end
  end

end


# test_music_path = "./spec/fixtures/mp3s"
# music_importer = MP3Importer.new(test_music_path)
#
# music_importer.files
