
class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path)[2..-1]
  end

  def import
    (Dir.entries(@path)[2..-1]).each do |file|
      Song.new_by_filename(file)
      # binding.pry
    end
  end

end
