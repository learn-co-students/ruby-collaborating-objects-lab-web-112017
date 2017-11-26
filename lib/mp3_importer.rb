require "pry"

class MP3Importer

attr_accessor :path


  def initialize(filepath)
    @path = filepath
  end

  #take a second look at the mechanics here
  def files
    array_full_names = Dir.glob("#{@path}/*.mp3")
    array_full_names.collect do |full_name|
      full_name[21..-1]
    end
  end

  def import
    files.each do |filename|
      song = Song.new_by_filename(filename)
    end
  end


end
