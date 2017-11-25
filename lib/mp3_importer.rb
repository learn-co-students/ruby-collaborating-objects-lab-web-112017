


class MP3Importer
  attr_accessor :path
  attr_reader :files

  def initialize (path)
    @path = path
    @files = (Dir.entries(@path)).select { |song| song[0] != "." }
  end


  def import
    self.files.each do |some_filename|
      # some_filename = mp3_file.split(" - ")
      Song.new_by_filename(some_filename)
    end
  end

end
