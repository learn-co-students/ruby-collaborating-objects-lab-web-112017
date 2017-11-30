class MP3Importer

	attr_accessor :path

def initialize(file_path)
	@path = file_path
end

def files
@files ||= Dir.glob("#{path}/*.mp3").collect{|f| f.gsub("#{path}/", "")}.sort()
end


def import  
	files.each{ |file_name| Song.new_by_filename(file_name) }
end


end