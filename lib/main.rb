require 'date'
require_relative 'infrastructure/reader'

class Main
  unless ARGV.nil? || ARGV.empty?
    File.open(ARGV[0]) do |file|
      Reader.new.read(file)
    end
  end
end
