require 'pry'
class Artist

@@all = []

	attr_accessor :name, :songs



def initialize(name)
@name = name
@songs = []
end

def add_song(song)
	@songs << song
	@songs
end

def self.all
	@@all
end
 
def save
	@@all << self
end

def self.find(name)
	artist = self.all.detect {|artist| artist.name == name}
end

def self.create(name)
	new_artist = Artist.new(name)
	new_artist.save
	new_artist
end

def self.find_or_create_by_name(name)
	self.find(name) || self.create(name)
end

def print_songs
	songs.each do |song|
		puts song.name
	end
end





end