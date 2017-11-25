class MP3Importer

attr_accessor :path

  def initialize(path)
    @path = path
  end

   def files
      @files ||= Dir.glob("#{@path}/*.mp3").collect{|filefull| File.basename(filefull)}
   end

  def import
    files.each do |filename|
    Song.new_by_filename(filename)
    end
  end



end
