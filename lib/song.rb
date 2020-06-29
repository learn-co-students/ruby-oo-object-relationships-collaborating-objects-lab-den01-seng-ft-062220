require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize name
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist= artist 
        @artist = artist
        @artist.songs << self
    end

    def artist_name= name
        find_result = Artist.all.find do |artist|
            artist.name == name
        end
        find_result = Artist.new name unless find_result

        find_result.add_song self
    end

    def self.new_by_filename file_name
        song = MP3Importer.normalize_name file_name
        new_song = Song.new(song[1])
        new_song.artist_name = song[0]
        new_song
    end



end