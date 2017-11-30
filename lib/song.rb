class Song

	attr_accessor :name, :artist

		@@songs = []

	def initialize(name)
		@name = name
		@@songs << self
	end

	def artist_name=(name)
		self.artist = Artist.find_or_create_by_name(name)
		artist.add_song(self)
	end

	def self.all
		@@songs
	end

	def self.new_by_filename(file_name)
		song_info = file_name.split(" - ")
		new_song = self.new(song_info[1])
		new_song.artist_name = song_info[0]
		new_song
	end



end