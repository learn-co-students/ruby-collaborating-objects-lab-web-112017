require 'pry'

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
    @files = Dir.entries(path).select { |file| !file.start_with?(".")}
  end

  def files
    @files
  end

  def import
    @files.each do |song|
      Song.new_by_filename(song.split(".")[0])
    end
  end

end
