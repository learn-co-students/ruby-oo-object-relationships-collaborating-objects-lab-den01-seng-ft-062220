require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize path
        @path = path
    end

    def files
        Dir.entries(@path).select do |file| 
            !File.directory? file
        end
    end

    def import
        files.each do |file_name|
            Song.new_by_filename file_name
        end
    end

    def self.normalize_name file_name
        file_name.split(' - ')
    end

end