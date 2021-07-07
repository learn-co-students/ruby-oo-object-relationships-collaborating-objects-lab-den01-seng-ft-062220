require 'pry'

class Artist
    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize name
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song song
        song.artist = self
    end

    def self.find_or_create_by_name name
        find_result = self.all.find do |artist|
            artist.name == name
        end
        find_result ? find_result : self.new(name)
    end

    def print_songs
        @songs.each do |song|
            puts song.name
        end
    end


        

end