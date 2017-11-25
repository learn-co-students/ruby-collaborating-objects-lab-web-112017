require "pry"
class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
    @files = []
  end

  def files
    #binding.pry
    import_files = Dir[@path+"/*"]
    #binding.pry
    import_files.map! { |e|
      e.slice (21..-1)
        }
    #binding.pry
    @files = import_files
  end

  def import
    #binding.pry
    files
    @files.each do |f|
      Song.new_by_filename(f)
    end
  end
end
