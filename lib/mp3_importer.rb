require "pry"

class MP3Importer

  attr_accessor :path

  def initialize(file_path)
    @path = file_path
    @files = Dir.glob(file_path + "/*.mp3")
  end

  def files
    @files.map do |file_name|
      file_name.split("./spec/fixtures/mp3s/")[1]
    end
  end

  def import
    self.files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
