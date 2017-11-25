class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.entries(@path).select { |filename| filename != "." && filename != ".." }
  end

  #   Dir.entries("/Users/siobhanpmahoney/Development/ruby-collaborating-objects-lab-web-112017/spec/fixtures/mp3s").select { |filename| filename != "." && filename != ".." }
  # end
#=> "Real Estate - It's Real - hip-hop.mp3", "Real Estate - Green Aisles - country.mp3", "Thundercat - For Love I Come - dance.mp3", "Action Bronson - Larry Csonka - indie.mp3"
  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end

end
